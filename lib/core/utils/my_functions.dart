import 'package:flutter/material.dart';

class MyFunctions {
  static void navigation(context, Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => (route)));
  }
}
