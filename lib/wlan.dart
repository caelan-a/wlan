import 'dart:async';

import 'package:flutter/services.dart';

class Wlan {
  static const MethodChannel _channel =
      const MethodChannel('github.caelana/wlan');

  static Future<bool> get isWifiEnabled async {
    final bool enabled = await _channel.invokeMethod('isWifiEnabled');
    return enabled;
  }
}
