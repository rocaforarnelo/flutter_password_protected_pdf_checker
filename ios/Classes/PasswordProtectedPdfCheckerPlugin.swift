import Flutter
import UIKit
import PDFKit

public class PasswordProtectedPdfCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.tarique/password_protected_pdf_checker", binaryMessenger: registrar.messenger())
    let instance = PasswordProtectedPdfCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    var isEncrypted = false
    guard let flutterData = call.arguments as? FlutterStandardTypedData else {
        result(isEncrypted)
        return
    }
    if let pdfDocument = PDFDocument(data: flutterData.data) {
        isEncrypted = pdfDocument.isEncrypted
    }
    result(isEncrypted);
  }
}
