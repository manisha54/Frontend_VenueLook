import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final List<String> venues = [
    'Kimchi banquet',
    'Durbar Banquet',
    'PhotoGrapher',
    // Add more venues as needed
  ];

  final List<String> messages = [
    'One of the famous banquet with good service',
    'affordable with good environment',
    'Best Photo Grapher',
    // Add more messages as needed
  ];

  final List<String> avatarImages = [
    'assets/images/naulo.jpg', // Replace with your own asset paths or URLs
    'assets/images/durbar.jpg',
    'assets/images/naulo.jpg',
    'assets/images/naulo.jpg',
    // Add more image paths or URLs for CircleAvatars
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
      ),
      body: ListView.builder(
        itemCount: venues.length,
        itemBuilder: (context, index) {
          String venueName = venues[index];
          String message = messages[index];
      //    String imagePath = 'assets/images/1_$index.jpg';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: Image.asset(
                      avatarImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        venueName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '12:45 PM',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
