import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_protected_pdf_checker/password_protected_pdf_checker_method_channel.dart';

void main() {
  MethodChannelPasswordProtectedPdfChecker platform = MethodChannelPasswordProtectedPdfChecker();
  const MethodChannel channel = MethodChannel('com.tarique/password_protected_pdf_checker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
