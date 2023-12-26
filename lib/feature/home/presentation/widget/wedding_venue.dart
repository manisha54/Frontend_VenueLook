import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WeddingVenue extends StatefulWidget {
  const WeddingVenue({super.key});

  @override
  State<WeddingVenue> createState() => _WeddingVenueState();
}

class _WeddingVenueState extends State<WeddingVenue> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              for (int i = 0; i < 10; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 500,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2)),
                        ]),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/venueDetailsRoute');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/1.png",
                              // fit: BoxFit.cover,
                              height: 120,
                              width: 150,
                            ),
                          ),
                        ),
                        SizedBox(
                          // color: const Color.fromARGB(255, 81, 166, 28),
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Crystal Banquet",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'RobotoCondensed Regular',
                                    fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                "Anamnagar Kathmandu",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'RobotoCondensed Regular',
                                    fontWeight: FontWeight.w400),
                              ),
                              RatingBar.builder(
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemSize: 18,
                                  itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.red
                                      ),
                                  onRatingUpdate: (index) {}),

                              //price and favourite button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Rs.1200(per plate)  ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'RobotoCondensed Regular',
                                      fontWeight: FontWeight.w500,
                                      color:Colors.red,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/favouriteRoute');
                                    },
                                    child: const Icon(
                                      Icons.favorite,
                                      color:Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )

                              // const Text(
                              //   "Rs.1200 per plate",
                              //   style: TextStyle(
                              //     fontSize: 14,
                              //     fontWeight: FontWeight.w500,
                              //     color: Color(0xFFFF1493),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Column(
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           Navigator.pushNamed(
                        //               context, '/favouriteRoute');
                        //         },
                        //         child: const Icon(
                        //           Icons.favorite,
                        //           color: Color(0xFFFF1493),
                        //           size: 20,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
            ],
          )),
    );
  }
}
