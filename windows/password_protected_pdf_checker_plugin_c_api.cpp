#include "include/password_protected_pdf_checker/password_protected_pdf_checker_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "password_protected_pdf_checker_plugin.h"

void PasswordProtectedPdfCheckerPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  password_protected_pdf_checker::PasswordProtectedPdfCheckerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
