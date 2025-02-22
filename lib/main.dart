import 'package:flutter/material.dart';
import 'package:cenl_mobile/pages/home.dart';
import 'package:cenl_mobile/pages/staff.dart';
import 'package:cenl_mobile/pages/student.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      routes: {
        '/': (context) => const Home(),
        '/student': (context) => const StudentWebView(),
        '/staff': (context) => const StaffWebView(),

      },
      // home: Home(),
    );
  }
}


