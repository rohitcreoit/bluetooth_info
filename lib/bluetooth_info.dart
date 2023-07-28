

import 'dart:async';
import 'package:flutter/services.dart';

class BluetoothInfo {
  static const MethodChannel _channel = MethodChannel('bluetooth_info');

  static Future<String> getDeviceName() async {
    final String deviceName = await _channel.invokeMethod('getDeviceName');
    return deviceName;
  }

  static Future<String> getDeviceAddress() async {
    final String deviceAddress = await _channel.invokeMethod('getDeviceAddress');
    return deviceAddress;
  }

  static Future<bool> isBluetoothEnabled() async {
    final bool isBluetoothEnabled = await _channel.invokeMethod('isBluetoothEnabled');
    return isBluetoothEnabled;
  }
}

