#ifndef FLUTTER_PLUGIN_PASSWORD_PROTECTED_PDF_CHECKER_PLUGIN_H_
#define FLUTTER_PLUGIN_PASSWORD_PROTECTED_PDF_CHECKER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace password_protected_pdf_checker {

class PasswordProtectedPdfCheckerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PasswordProtectedPdfCheckerPlugin();

  virtual ~PasswordProtectedPdfCheckerPlugin();

  // Disallow copy and assign.
  PasswordProtectedPdfCheckerPlugin(const PasswordProtectedPdfCheckerPlugin&) = delete;
  PasswordProtectedPdfCheckerPlugin& operator=(const PasswordProtectedPdfCheckerPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace password_protected_pdf_checker

#endif  // FLUTTER_PLUGIN_PASSWORD_PROTECTED_PDF_CHECKER_PLUGIN_H_
