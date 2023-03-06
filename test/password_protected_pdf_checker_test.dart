import 'package:flutter_test/flutter_test.dart';
import 'package:password_protected_pdf_checker/password_protected_pdf_checker.dart';
import 'package:password_protected_pdf_checker/password_protected_pdf_checker_platform_interface.dart';
import 'package:password_protected_pdf_checker/password_protected_pdf_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPasswordProtectedPdfCheckerPlatform
    with MockPlatformInterfaceMixin
    implements PasswordProtectedPdfCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PasswordProtectedPdfCheckerPlatform initialPlatform = PasswordProtectedPdfCheckerPlatform.instance;

  test('$MethodChannelPasswordProtectedPdfChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPasswordProtectedPdfChecker>());
  });

  test('getPlatformVersion', () async {
    PasswordProtectedPdfChecker passwordProtectedPdfCheckerPlugin = PasswordProtectedPdfChecker();
    MockPasswordProtectedPdfCheckerPlatform fakePlatform = MockPasswordProtectedPdfCheckerPlatform();
    PasswordProtectedPdfCheckerPlatform.instance = fakePlatform;

    expect(await passwordProtectedPdfCheckerPlugin.getPlatformVersion(), '42');
  });
}
