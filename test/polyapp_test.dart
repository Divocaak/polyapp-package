import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:polyapp/polyApp.dart';

void main() {
  const MethodChannel channel = MethodChannel('polyapp');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await PolyApp.platformVersion, '42');
  });
}
