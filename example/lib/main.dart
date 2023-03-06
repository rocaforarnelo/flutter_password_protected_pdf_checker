import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:password_protected_pdf_checker/password_protected_pdf_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _isPasswordProtected = false;
  final _passwordProtectedPdfCheckerPlugin = PasswordProtectedPdfChecker();

  @override
  void initState() {
    super.initState();
    //initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _passwordProtectedPdfCheckerPlugin.getPlatformVersion() ??
              'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('isPasswordProtected: $_isPasswordProtected\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            FilePickerResult? filePaths = await FilePicker.platform.pickFiles();
            if (filePaths?.files.single.path != null) {
              File file = File(filePaths!.files.single.path!);
              final bytes = file.readAsBytesSync();
              final passwordProtectedChecker = PasswordProtectedPdfChecker();
              final result =
              await passwordProtectedChecker.isPDFPasswordProtected(bytes);
              setState(() {
                _isPasswordProtected = result;
              });
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
