import 'dart:io';

import 'package:flutter/material.dart';

import 'input_field.dart';
import 'model/location.dart';
import 'route_wrapper.dart';

class AddressForm extends StatefulWidget {
  const AddressForm(
      {super.key,
      required this.apiKey,
      this.address2Controller,
      this.addressController,
      this.cityController,
      this.countryController,
      this.zipController,
      this.addressValidator,
      this.address2Validator,
      this.zipValidator,
      this.cityValidator,
      this.cityLabel = "City",
      this.zipLabel = "Postcode",
      this.streetAddressLabel = "Street address",
      this.secondaryAddressLabel = "Apt, suite, etc."});

  final String apiKey;
  final TextEditingController? addressController;
  final TextEditingController? address2Controller;
  final TextEditingController? zipController;
  final TextEditingController? cityController;
  final TextEditingController? countryController;
  final String? Function(String?)? addressValidator;
  final String? Function(String?)? address2Validator;
  final String? Function(String?)? zipValidator;
  final String? Function(String?)? cityValidator;

  final String streetAddressLabel;
  final String secondaryAddressLabel;
  final String zipLabel;
  final String cityLabel;

  @override
  State<AddressForm> createState() => AddressFormState();
}

class AddressFormState extends State<AddressForm> {
  late final TextEditingController _streetAddressController;
  late final TextEditingController _secondaryAddressController;
  late final TextEditingController _zipController;
  late final TextEditingController _cityController;
  Location? location;

  late Widget child;
  late FocusNode addressNode;

  bool modalOpen = false;
  Duration addressTransitionDuration = const Duration(milliseconds: 300);

  void setModalOpen(bool val) {
    setState(() {
      modalOpen = val;
    });
  }

  @override
  void initState() {
    _streetAddressController =
        widget.addressController ?? TextEditingController();
    _secondaryAddressController =
        widget.address2Controller ?? TextEditingController();
    _zipController = widget.zipController ?? TextEditingController();
    _cityController = widget.cityController ?? TextEditingController();
    addressNode = FocusNode();
    child = Material(
        type: MaterialType.transparency,
        // color: Colors.transparent,
        child: StatefulBuilder(
          builder: (context, setSelf) {
            return InputField(
              controller: _streetAddressController,
              label: widget.streetAddressLabel,
              //autoFocus: modalOpen,
              focusNode: addressNode,
              validator: widget.addressValidator,
              prefix: !modalOpen
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        setSelf(
                          () {
                            modalOpen = false;
                          },
                        );
                        Navigator.of(context).pop();
                      }),
              onTap: modalOpen
                  ? null
                  : () {
                      setSelf(() {
                        modalOpen = true;
                      });
                      Future.delayed(addressTransitionDuration)
                          .then((_) => addressNode.requestFocus());
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: addressTransitionDuration,
                          reverseTransitionDuration: addressTransitionDuration,
                          opaque: false,
                          fullscreenDialog: true,
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          pageBuilder: (context, a, b) {
                            return AddressPickerRouteWrapper(
                              apiKey: widget.apiKey,
                              anim: b,
                              addressController: _streetAddressController,
                              zipController: _zipController,
                              cityController: _cityController,
                              setModal: setModalOpen,
                              child: child,
                            );
                          }));
                    },
            );
          },
        ));
    super.initState();
  }

  @override
  void dispose() {
    addressNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(tag: "street", child: child),
        InputField(
            controller: _secondaryAddressController,
            label: widget.secondaryAddressLabel),
        LayoutBuilder(builder: (c, b) {
          return Wrap(
            spacing: 10,
            children: [
              SizedBox(
                  width: (b.maxWidth / 2) - 5,
                  child: InputField(
                      controller: _zipController,
                      validator: widget.zipValidator,
                      label: widget.zipLabel)),
              SizedBox(
                  width: (b.maxWidth / 2) - 5,
                  child: InputField(
                      controller: _cityController,
                      validator: widget.cityValidator,
                      label: widget.cityLabel))
            ],
          );
        }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            child: const Text('submit'),
            onPressed: () {
              Map<String, String> map = {
                'street': _streetAddressController.text,
                'unit': _secondaryAddressController.text,
                'city': _cityController.text,
                'postalCode': _zipController.text
                // todo add more fields in ui and update here if time persist
              };

              writeJSON(map.toString());
           
            },
          ),
        )
      ],
    );
  }

  Future writeJSON(String content) async {
    Directory current = Directory.current;
    String appDocumentsPath = current.path;
    String filePath = '$appDocumentsPath\\${getCurrentDate()}.json';
    File file = File(filePath);
    file.writeAsString(content);
  }

  getCurrentDate() {
    DateTime now = DateTime.now();

    return "${now.year}${now.month}${now.day}"
        "-${now.hour}${now.minute}.${now.second}";
  }
}
