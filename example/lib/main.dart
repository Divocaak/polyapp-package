import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:polyapp/poly_app.dart';
import 'package:polyapp/poly_app_object.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<PolyAppObject?> polyAppObject;

  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion =
          await PolyApp.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    polyAppObject = PolyApp.getOptions("http://localhost/test.php");
    return MaterialApp(
        home: Scaffold(
            body: FutureBuilder<PolyAppObject?>(
                future: polyAppObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        snapshot.data!.devName + ", " + snapshot.data!.devMail,
                        style: TextStyle(color: snapshot.data!.primaryColor));
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("někde se stala chyba"));
                  } else {
                    return const Center(child: Text("žádné hodnoty"));
                  }
                })));
  }
}
