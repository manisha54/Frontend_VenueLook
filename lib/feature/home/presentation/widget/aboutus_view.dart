import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutUsView extends ConsumerStatefulWidget {
  const AboutUsView({super.key});

  @override
  ConsumerState<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends ConsumerState<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Custom toolbar height
        child: AppBar(
          title: const Text("About Us"),
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: RichText(
                text: const TextSpan(
                  text: ("Venue"),
                  style: TextStyle(
                    color: Color(0xFF41409E),
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  children: [
                    TextSpan(
                      text: "Look",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                    color: Color(0xFFFF1493),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 17),
            child: Text(
              "A VenueLook is a venue booking mobile application designed to help users find venues for various occasions such as weddings, parties, meetings, and conferences as well as venue owners can register their venue. This platform provides a convenient way for users to search for book venues without any difficulty.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 40),
          const Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 17),
                  child: Text(
                    "Office Location : Anamnagar ktm ",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 17),
                  child: Text(
                    "Contact number: 9800562062",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
