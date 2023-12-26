import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeeUserView extends ConsumerStatefulWidget {
  const SeeUserView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SeeUserViewState();
}

class _SeeUserViewState extends ConsumerState<SeeUserView> {
  // Sample user data with booked venues
  final List<User> users = [
    User('1', 'Manisha Tharu', 9800562062, 'manisha@example.com', ['Thapagaun banquet'],
        DateTime.now()),
    User('2', 'Manju Tharu', 9864968870, 'manju@example.com', ['Lotus banquet'],
        DateTime.now()),
    // Add more users here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View All Users"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Date: ${user.date.toLocal().toString()}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Time: ${user.date.toLocal().toString().split(' ')[1]}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Contact Number: ${user.contactNumber}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Email: ${user.email}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Booked Venue: ${user.bookedVenues.join(", ")}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class User {
  final String id;
  final String name;
  final int contactNumber;
  final String email;
  final List<String> bookedVenues;
  final DateTime date;

  User(this.id, this.name, this.contactNumber, this.email, this.bookedVenues, this.date);
}
