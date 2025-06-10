import 'dart:developer'; // For logging in the fromJson method

class Activity {
  final String activity;
  final double availability;
  final String type;
  final int participants;
  final double price;
  final String accessibility;
  final String duration;
  final bool kidFriendly;
  final String link;
  final String key;

  const Activity({
    required this.activity,
    required this.availability,
    required this.type,
    required this.participants,
    required this.price,
    required this.accessibility,
    required this.duration,
    required this.kidFriendly,
    required this.link,
    required this.key,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    try {
      return Activity(
        activity: json['activity'] as String,
        // The API might return availability as an int (e.g., 0)
        // Casting to num then toDouble() handles both int and double values correctly.
        availability: (json['availability'] as num).toDouble(),
        type: json['type'] as String,
        participants: json['participants'] as int,
        // The API might return price as an int (e.g., 0)
        // Casting to num then toDouble() handles both int and double values correctly.
        price: (json['price'] as num).toDouble(),
        accessibility: json['accessibility'] as String,
        duration: json['duration'] as String,
        kidFriendly: json['kidFriendly'] as bool,
        link: json['link'] as String,
        key: json['key'] as String,
      );
    } catch (e) {
      // Log the specific error and the problematic JSON for debugging
      log('Error parsing Activity JSON: $e\nJSON received: $json');
      throw const FormatException(
        'Failed to load activity. Data format mismatch.',
      );
    }
  }
}
