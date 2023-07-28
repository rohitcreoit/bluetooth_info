package com.example.bluetooth_info

import android.bluetooth.BluetoothAdapter
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class BluetoothInfoPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

  private lateinit var channel: MethodChannel
  private lateinit var bluetoothAdapter: BluetoothAdapter

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "bluetooth_info")
    channel.setMethodCallHandler(this)
    bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "getDeviceName" -> {
        val deviceName = getBluetoothDeviceName()
        result.success(deviceName)
      }
      "getDeviceAddress" -> {
        val deviceAddress = getBluetoothDeviceAddress()
        result.success(deviceAddress)
      }
      "isBluetoothEnabled" -> {
        val isBluetoothEnabled = isBluetoothEnabled()
        result.success(isBluetoothEnabled)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun getBluetoothDeviceName(): String {
    return bluetoothAdapter.name ?: ""
  }

  private fun getBluetoothDeviceAddress(): String {
    return bluetoothAdapter.address ?: ""
  }

  private fun isBluetoothEnabled(): Boolean {
    return bluetoothAdapter.isEnabled
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
