import 'package:flutter/material.dart';
import 'package:test_apps/data/notifiers.dart';
import 'package:test_apps/views/pages/welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/images/bg.jpg'),
        ),
        ListTile(
          title: Text("Logout"),
          onTap: () {
            selectedPageNotifier.value = 0;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          },
        ),
      ],
    );
  }
}
