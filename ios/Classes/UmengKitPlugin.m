#import "UmengKitPlugin.h"
#import <UMCommon/UMConfigure.h>
#import <UMCommon/MobClick.h>

@implementation UmengKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"v7lin.github.io/umeng_kit"
            binaryMessenger:[registrar messenger]];
  UmengKitPlugin* instance = [[UmengKitPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"init" isEqualToString:call.method]) {
      NSString *appkey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"UMENG_APPKEY"];
      NSString *channelId = call.arguments[@"channel_id"];
      [UMConfigure initWithAppkey:appkey channel:channelId];
      [MobClick setAutoPageEnabled:NO];
      result(nil);
  } else if ([@"setLogEnabled" isEqualToString:call.method]) {
      NSNumber *enabled = call.arguments[@"enabled"];
      [UMConfigure setLogEnabled:enabled.boolValue];
      result(nil);
  } else if ([@"startPageTracking" isEqualToString:call.method]) {
      NSString *pageName = call.arguments[@"page_name"];
      [MobClick beginLogPageView:pageName];
      result(nil);
  } else if ([@"stopPageTracking" isEqualToString:call.method]) {
      NSString *pageName = call.arguments[@"page_name"];
      [MobClick endLogPageView:pageName];
      result(nil);
  } else if ([@"trackEvent" isEqualToString:call.method]) {
      NSString *eventId = call.arguments[@"event_id"];
      NSDictionary *eventParams = call.arguments[@"event_params"];
      [MobClick event:eventId attributes:eventParams];
      result(nil);
  } else {
      result(FlutterMethodNotImplemented);
  }
}

@end
