package com.tarique.password_protected_pdf_checker

import android.content.Context
import androidx.annotation.NonNull
import com.tom_roush.pdfbox.android.PDFBoxResourceLoader
import com.tom_roush.pdfbox.pdmodel.PDDocument
import com.tom_roush.pdfbox.pdmodel.encryption.InvalidPasswordException

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PasswordProtectedPdfCheckerPlugin */
class PasswordProtectedPdfCheckerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.tarique/password_protected_pdf_checker")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    PDFBoxResourceLoader.init(context)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "checkPasswordProtectedPDF"){
      try {
        val bytes: ByteArray? = call.arguments()
        val isPasswordProtected = try {
          val pdDocument = PDDocument.load(bytes)
          pdDocument.isEncrypted
        } catch (e: InvalidPasswordException) {
          true
        }
        result.success(isPasswordProtected)
      } catch (e: java.lang.Exception) {
        result.success(false)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
