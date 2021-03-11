
import 'dart:async';

import 'package:flutter/services.dart';

class UmengKit {
  static const MethodChannel _channel =
      const MethodChannel('umeng_kit');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
