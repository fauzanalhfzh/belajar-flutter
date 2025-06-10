import 'package:flutter/material.dart';
import 'package:test_apps/data/constants.dart';
import 'package:test_apps/views/pages/course_page.dart';
import 'package:test_apps/views/pages/expanded_flexible_page.dart';
import 'package:test_apps/views/widgets/container_widget.dart';
import 'package:test_apps/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listData = [
      Kvalue.basicLayout,
      Kvalue.cleanUi,
      Kvalue.fixBugs,
      Kvalue.keyConcepts,
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            HeroWidget(title: "Belajar Flutter", nextPage: CoursePage()),
            SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpandedFlexiblePage(),
                  ),
                );
              },
              child: Text("Expanded Page"),
            ),
            // this how you add many widget in flutter #1
            ...List.generate(listData.length, (index) {
              return ContainerWidget(
                title: listData.elementAt(index),
                description: "This is a description",
              );
            }),
            // this how you add many widget in flutter #2
            Column(
              children: List.generate(
                5,
                (index) => ContainerWidget(
                  title: "Basic Layout",
                  description: "This is a custom container",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
