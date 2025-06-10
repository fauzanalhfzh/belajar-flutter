import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test_apps/data/constants.dart';
import 'package:test_apps/views/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/wallet.json', height: 400.0),
                SizedBox(height: 20.0),
                Text(
                  "Aplikasi ini dibuat untuk mempelajari flutter lebih dalam menggunakan Widget",
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(title: "Register"),
                      ),
                    );
                  },
                  child: Text("Next"),
                ),
                SizedBox(height: 70.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
