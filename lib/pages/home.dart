import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.indigo.shade900, // Deep indigo at the top
              Colors.indigo.shade700, // Mid indigo
              Colors.indigo.shade400, // Lighter indigo
              Colors.white,          // Transition to white
            ],
            stops: const [
              0.0, 0.3, 0.6, 1.0,
            ], // Smooth transition to white
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2), // Spacer to push content down
            const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.school,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'CENL MOBILE APP',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 3), // Spacer to push buttons down
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/staff');

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Button background color
                      minimumSize: const Size(double.infinity, 50), // Full-width button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Staff Login',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/student');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo, // Button background color
                      minimumSize: const Size(double.infinity, 50), // Full-width button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Student Login',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1), // Final spacer for bottom padding
          ],
        ),
      ),
    );
  }
}