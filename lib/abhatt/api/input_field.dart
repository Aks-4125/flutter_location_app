import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.controller,
      this.validator,
      this.obscureText,
      this.maxLines,
      this.icon,
      this.onTap,
      this.prefix,
      this.autoFocus = false,
      this.focusNode,
      this.readOnly = false,
      required this.label})
      : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final String label;
  final int? maxLines;
  final IconData? icon;
  final Function? onTap;
  final Widget? prefix;
  final bool autoFocus;
  final FocusNode? focusNode;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Color(0xff666666))),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              autofocus: autoFocus,
              focusNode: focusNode,
              onTap: onTap == null ? null : () => onTap!(),
              maxLines: obscureText == true ? 1 : maxLines,
              controller: controller,
              validator: validator,
              obscureText: obscureText ?? false,
              readOnly: readOnly,
              decoration: InputDecoration(
                fillColor: const Color(0xfff6f6f6),
                filled: true,
                //hintText: label,
                //labelText: label,
                labelStyle: TextStyle(color: Colors.grey[500]),
                alignLabelWithHint: true,
                prefixIcon: prefix,
                suffixIcon: Icon(
                  icon,
                  color:
                      // const Color(0xFF151624).withOpacity(0.5)
                      const Color(0xff666666),
                  size: 16,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.transparent
                        //Color(0xff29b973),
                        )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff29b973),
                    )),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ));
  }
}
