import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends StatelessWidget {
  const NavigationControls({required this.controller, super.key});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            if (await controller.canGoBack()) {
              await controller.goBack();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No back history item')),
              );
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            if (await controller.canGoForward()) {
              await controller.goForward();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No forward history item')),
              );
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () {
            controller.reload();
          },
        ),
      ],
    );
  }
}
