import 'package:flutter/material.dart';

class PopularVenue extends StatelessWidget {
  
  const PopularVenue({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            //single venue
            for (int i = 0; i < 10; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Container(
                  height: 225,
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            //spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2)),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/venueDetailsRoute');
                          },
                          child: SizedBox(
                            height: 140,
                            child: Image.asset(
                              "assets/images/1.png",
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Crystal banquet, Anamnagar,ktm ",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Rs.1200(per plate)",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.red
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/favouriteRoute');
                              },
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
