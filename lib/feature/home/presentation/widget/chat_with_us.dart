import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatWithUs extends ConsumerStatefulWidget {
  const ChatWithUs({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatWithUsState();
}

class _ChatWithUsState extends ConsumerState<ChatWithUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kimchi Banquet"),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual message count
        itemBuilder: (context, index) {
          // Replace these placeholders with actual data
          bool isMyMessage = index % 2 == 0; // Just for demo purpose
          String message = 'This is message $index';
          String venueName = 'Venue $index';

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMyMessage)
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                  ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: isMyMessage
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        venueName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          color: isMyMessage ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: isMyMessage ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isMyMessage)
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
