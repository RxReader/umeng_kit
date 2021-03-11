import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:umeng_kit/umeng_kit.dart';

void main() {
  const MethodChannel channel = MethodChannel('umeng_kit');

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
    expect(await UmengKit.platformVersion, '42');
  });
}
