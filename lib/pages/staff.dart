import 'package:flutter/material.dart';
import 'package:cenl_mobile/src/navigation_control.dart';
import 'package:cenl_mobile/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StaffWebView extends StatefulWidget {
  const StaffWebView({super.key});

  @override
  State<StaffWebView> createState() => _StaffWebViewState();
}

class _StaffWebViewState extends State<StaffWebView> {

   late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://demo.cenl.com.ng/staff/login'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Disables the back arrow
        title: const Text(
          'GGLAB Mobile App',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
            )
          ),
        // Add from here...
        actions: [
          NavigationControls(controller: controller),
        ],
        // ...to here.
      ),
      body: WebViewStack(controller: controller),       // MODIFY
    );
  }
}