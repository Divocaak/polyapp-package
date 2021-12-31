import 'package:flutter/material.dart';

class PolyAppObject {
  String primaryColorString;
  String devName;
  String devMail;

  PolyAppObject(this.primaryColorString, this.devName, this.devMail);

  Color primaryColorHex() {
    final buffer = StringBuffer();
    if (primaryColorString.length == 6 || primaryColorString.length == 7) {
      buffer.write('ff');
    }

    buffer.write(primaryColorString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  factory PolyAppObject.fromJson(Map json) =>
      PolyAppObject(json["primaryColor"], json["devName"], json["devMail"]);
}
