import 'package:flutter/material.dart';
import 'package:policiafederal_app/Pages/SlidesPage.dart';

void main() {
  runApp(new PoliciaFederalApp());
}

class PoliciaFederalApp extends StatefulWidget {
  @override
  PoliciaFederalAppState createState() => new PoliciaFederalAppState();
}

class PoliciaFederalAppState extends State<PoliciaFederalApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new SlidesPage(),
    );
  }
}
