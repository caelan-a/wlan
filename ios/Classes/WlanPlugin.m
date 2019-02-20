#import "WlanPlugin.h"

@implementation WlanPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"github.caelana/wlan"
            binaryMessenger:[registrar messenger]];
  WlanPlugin* instance = [[WlanPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"isWifiEnabled" isEqualToString:call.method]) {
    result(@true);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
