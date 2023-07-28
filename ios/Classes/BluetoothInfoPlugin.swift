import Flutter
import UIKit
import CoreBluetooth

public class SwiftBluetoothInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "bluetooth_info", binaryMessenger: registrar.messenger())
    let instance = SwiftBluetoothInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getDeviceName":
        let deviceName = getBluetoothDeviceName()
        result(deviceName)
    case "getDeviceAddress":
        let deviceAddress = getBluetoothDeviceAddress()
        result(deviceAddress)
    case "isBluetoothEnabled":
        let isBluetoothEnabled = isBluetoothEnabled()
        result(isBluetoothEnabled)
    default:
        result(FlutterMethodNotImplemented)
    }
  }

  private func getBluetoothDeviceName() -> String {
    let centralManager = CBCentralManager()
    return centralManager.identifier.uuidString
  }

  private func getBluetoothDeviceAddress() -> String {
    let centralManager = CBCentralManager()
    return centralManager.identifier.uuidString
  }

  private func isBluetoothEnabled() -> Bool {
    let centralManager = CBCentralManager()
    return centralManager.state == .poweredOn
  }
}
