#include "include/bluetooth_info/bluetooth_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "bluetooth_info_plugin.h"

void BluetoothInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  bluetooth_info::BluetoothInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
