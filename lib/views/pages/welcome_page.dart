import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_apps/views/pages/login_page.dart';
import 'package:test_apps/views/pages/onboarding_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/gold.json', height: 400.0),
                FittedBox(
                  child: Text(
                    "Danarin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70.0,
                      letterSpacing: 4.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                FittedBox(
                  child: Text(
                    "😁 Solusi manajemen pembayaranmu untuk habis borosmu itu 😁",
                  ),
                ),
                SizedBox(height: 20.0),
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingPage()),
                  ),
                  child: Text('REGISTER'),
                ),
                OutlinedButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(title: "LOGIN"),
                    ),
                  ),
                  child: Text('LOGIN'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
