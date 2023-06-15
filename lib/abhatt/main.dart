import 'package:flutter/material.dart';

import 'BaseAppBar.dart';
import 'api/address_form.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.white),
      home: const MyHomePage(title: 'Enter Address'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(widget.title),
        appBar: AppBar(),
        widgets: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AddressForm(
                apiKey: "AIzaSyBpJtmCgHDJw8QP2PDcXiUiO67dSus5H3I"
              )
            ],
          )),
    );
  }
}
