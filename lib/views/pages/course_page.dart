import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_apps/data/classes/activity_class.dart'; // Ensure this path is correct
import 'package:test_apps/views/widgets/hero_widget.dart'; // Ensure this path is correct
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  // Declare a late Future variable to hold the result of getData()

  @override
  void initState() {
    super.initState();
    // Initialize the future once in initState
    getData();
  }

  Future<Activity> getData() async {
    try {
      var url = Uri.https('bored-api.appbrewery.com', '/random');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        log('Activity fetched successfully.');
        return Activity.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      } else {
        // If the server returns an error response, throw an exception.
        log('Request activity failed with status: ${response.statusCode}.');
        throw Exception(
          'Failed to load activity. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      log('An error occurred during data fetching: $e');
      throw Exception('Failed to load activity: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Page'), // Added a title for clarity
      ),
      body: SingleChildScrollView(
        // Pass the initialized future to FutureBuilder
        child: FutureBuilder<Activity>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show loading indicator while waiting for data
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(
                    20.0,
                  ), // Add padding for better spacing
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              // Show error message if something went wrong
              log('FutureBuilder encountered an error: ${snapshot.error}');
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Error: ${snapshot.error}\nTap to retry',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              // Display activity details when data is available
              Activity activity =
                  snapshot.data!; // Use ! as we've confirmed hasData is true
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to start
                  children: [
                    HeroWidget(title: activity.activity),
                    const SizedBox(height: 10), // Spacing
                    Text(
                      'Type: ${activity.type}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Participants: ${activity.participants}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Price: \$${activity.price.toStringAsFixed(2)}', // Format price to 2 decimal places
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Accessibility: ${activity.accessibility}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Duration: ${activity.duration}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Kid Friendly: ${activity.kidFriendly ? 'Yes' : 'No'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    if (activity.link.isNotEmpty)
                      Text(
                        'Link: ${activity.link}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    Text(
                      'Key: ${activity.key}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20), // Spacing
                    const Divider(color: Colors.blue, thickness: 2.0),
                  ],
                ),
              );
            } else {
              // Fallback for any other unexpected state (shouldn't typically be hit with the above logic)
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('No data available.'),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // When button is pressed, re-fetch data and update the FutureBuilder
          setState(() {
            getData();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
