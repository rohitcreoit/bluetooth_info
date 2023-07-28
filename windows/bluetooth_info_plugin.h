#ifndef FLUTTER_PLUGIN_BLUETOOTH_INFO_PLUGIN_H_
#define FLUTTER_PLUGIN_BLUETOOTH_INFO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace bluetooth_info {

class BluetoothInfoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BluetoothInfoPlugin();

  virtual ~BluetoothInfoPlugin();

  // Disallow copy and assign.
  BluetoothInfoPlugin(const BluetoothInfoPlugin&) = delete;
  BluetoothInfoPlugin& operator=(const BluetoothInfoPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace bluetooth_info

#endif  // FLUTTER_PLUGIN_BLUETOOTH_INFO_PLUGIN_H_
