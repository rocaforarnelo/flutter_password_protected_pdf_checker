//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <password_protected_pdf_checker/password_protected_pdf_checker_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) password_protected_pdf_checker_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PasswordProtectedPdfCheckerPlugin");
  password_protected_pdf_checker_plugin_register_with_registrar(password_protected_pdf_checker_registrar);
}
