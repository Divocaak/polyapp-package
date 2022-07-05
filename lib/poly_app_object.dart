import 'package:flutter/material.dart';

class PolyAppObject {
  Color primaryColor;
  String devName;
  String devMail;

  PolyAppObject(this.primaryColor, this.devName, this.devMail);

  static Color primaryColorHex(String primaryColorString) {
    final buffer = StringBuffer();
    if (primaryColorString.length == 6 || primaryColorString.length == 7) {
      buffer.write('ff');
    }

    buffer.write(primaryColorString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  factory PolyAppObject.fromJson(Map json) => PolyAppObject(
      primaryColorHex(json["primaryColor"]), json["devName"], json["devMail"]);
}
