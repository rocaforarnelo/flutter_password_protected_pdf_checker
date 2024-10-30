
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'password_protected_pdf_checker_platform_interface.dart';

class PasswordProtectedPdfChecker {

  static const MethodChannel _channel = MethodChannel('com.tarique/password_protected_pdf_checker');

  Future<String?> getPlatformVersion() {
    return PasswordProtectedPdfCheckerPlatform.instance.getPlatformVersion();
  }

  Future<bool> isPDFPasswordProtected(Uint8List bytes) async {
    if (isPdfEncrypted(bytes)) {
      try {
        final bool result =
            await _channel.invokeMethod('checkPasswordProtectedPDF', bytes);
        return result;
      } catch (error) {
        if (kDebugMode) {
          print('Error inside isPDFPasswordProtected: ${error.toString()}');
        }
      }
      return false;
    } else {
      return false;
    }
  }

  bool isPdfEncrypted(Uint8List fileBytes) {
    try {
      // Check if the file is smaller than the trailer length we want to analyze
      const int trailerLength = 2048;
      final int startPosition = fileBytes.length > trailerLength
          ? fileBytes.length - trailerLength
          : 0;

      // Extract the last 2048 bytes or the whole file if it's smaller
      final trailerBytes = fileBytes.sublist(startPosition);

      // Convert the bytes to a string and check for /Encrypt
      final trailerString = String.fromCharCodes(trailerBytes);
      return trailerString.contains('/Encrypt');
    } catch (e) {
      // ignore: avoid_print
      print("Error checking file: $e");
      return false;
    }
  }

}
