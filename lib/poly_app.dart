import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:polyapp/poly_app_object.dart';

class PolyApp {
  static const MethodChannel _channel = MethodChannel('polyapp');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<PolyAppObject?> getOptions(url) async {
    final Response response = await get(Uri.parse(Uri.encodeFull(url)),
        headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8"});
    return response.statusCode == 200
        ? PolyAppObject.fromJson(jsonDecode((response.body)))
        : null;
  }
}
