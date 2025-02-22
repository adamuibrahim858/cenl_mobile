import 'package:cenl_mobile/src/navigation_control.dart';
import 'package:cenl_mobile/src/web_view_stack.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentWebView extends StatefulWidget {
  const StudentWebView({super.key});

  @override
  State<StudentWebView> createState() => _StudentWebViewState();
}

class _StudentWebViewState extends State<StudentWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
            // Check if the URL is a downloadable file
            if (request.url.endsWith('.pdf')) {
              // Show alert when download is triggered
              _showDownloadAlert();

              // Use an external app to handle the download
              await _launchUrl(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://demo.cenl.com.ng/student/login'),
      )
      ..addJavaScriptChannel(
        'DownloadAlert', // JavaScript channel for handling alerts
        onMessageReceived: (JavaScriptMessage message) {
          // Display the alert
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..runJavaScript(_injectJavaScript()); // Inject JavaScript to listen for button clicks
  }

  /// Inject JavaScript to detect clicks on the download button
  String _injectJavaScript() {
    return """
      document.addEventListener('DOMContentLoaded', function() {
        const downloadButton = document.getElementById('download-btn'); // Update with the correct ID
        if (downloadButton) {
          downloadButton.addEventListener('click', function() {
            DownloadAlert.postMessage('Download button clicked!');
          });
        }
      });
    """;
  }

  /// Launches the given URL in an external app or browser
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens in the default browser or external app
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the file')),
      );
    }
  }

  /// Displays an alert when download is triggered
  void _showDownloadAlert() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download started...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'CENL Mobile App',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewStack(controller: controller),
    );
  }
}
