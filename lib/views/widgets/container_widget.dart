import 'package:flutter/material.dart';
import 'package:test_apps/data/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: KTextStyle.titleBlueText),
              Text(description, style: KTextStyle.descriptionText),
            ],
          ),
        ),
      ),
    );
  }
}
