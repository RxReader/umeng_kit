import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Umeng {
  const Umeng._();

  static const MethodChannel _channel = MethodChannel('v7lin.github.io/umeng_kit');

  static Future<void> init({
    @required String appKey,
    String channelId,
  }) {
    assert(appKey?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>('init', <String, dynamic>{
      'app_key': appKey,
      if (channelId?.isNotEmpty ?? false) 'channel_id': channelId,
    });
  }

  static Future<void> setLogEnabled({@required bool enabled}) {
    return _channel.invokeMethod<void>('setLogEnabled', <String, dynamic>{
      'enabled': enabled,
    });
  }

  static Future<void> startPageTracking({@required String pageName}) {
    assert(pageName?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>('startPageTracking', <String, dynamic>{
      'page_name': pageName,
    });
  }

  static Future<void> stopPageTracking({@required String pageName}) {
    assert(pageName?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>('stopPageTracking', <String, dynamic>{
      'page_name': pageName,
    });
  }

  static Future<void> trackEvent({
    @required String eventId,
    Map<String, dynamic/* String/int/double */> eventParams,
  }) {
    assert(eventId?.isNotEmpty ?? false);
    assert(eventParams == null ||eventParams.entries.every((MapEntry<String, dynamic> element) {
      return (element.key.isNotEmpty ?? false) && (element.value != null && (element.value is String || element.value is int || element.value is double));
    }));
    return _channel.invokeMethod<void>('trackEvent', <String, dynamic>{
      'event_id': eventId,
      if (eventParams?.isNotEmpty ?? false) 'event_params': eventParams,
    });
  }
}
