
import 'package:flutter/services.dart';

import 'password_protected_pdf_checker_platform_interface.dart';

class PasswordProtectedPdfChecker {

  static const MethodChannel _channel = MethodChannel('com.tarique/password_protected_pdf_checker');

  Future<String?> getPlatformVersion() {
    return PasswordProtectedPdfCheckerPlatform.instance.getPlatformVersion();
  }

  Future<bool> isPDFPasswordProtected(Uint8List bytes) async{
    try {
      final bool result = await _channel.invokeMethod('checkPasswordProtectedPDF', bytes);
      return result;
    } catch (error) {
      print('Error inside isPDFPasswordProtected: ${error.toString()}');
    }

    return false;
  }
}
