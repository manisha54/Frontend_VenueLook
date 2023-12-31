import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/presentation/viewmodel/venue_view_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../config/router/app_route.dart';

class VenueDetailsView extends ConsumerStatefulWidget {
  const VenueDetailsView({Key? key}) : super(key: key);

  @override
  ConsumerState<VenueDetailsView> createState() => _VenueDetailsViewState();
}

class _VenueDetailsViewState extends ConsumerState<VenueDetailsView> {
  @override
  Widget build(BuildContext context) {
    var venueState = ref.watch(venueViewModelProvider);

    // Simulated venue information for demonstration, replace with your actual data
    List<String> venueInfo = [
      'Seating Capacity-1000',
      'Catering',
      'Sound System',
      'Decoration',
      'Wifi',
      'Parking'
    ];

    // Simulated ratings for demonstration, replace these with your actual rating data
    List<int> ratings = [3, 4, 5, 2, 4];
    ratings.sort(); // Sort ratings from small to large

// Placeholder for review data structure
    List<Map<String, dynamic>> reviews = [
      {
        'user': 'Manisha',
        'profilePic': 'assets/images/naulo.jpg',
        'review': 'This venue is awesome!',
        'rating': 5,
      },
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(260),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    ApiEndpoints.imageUrl + venueState.singleVenue![0].picture,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Venue Name and Per Plate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      venueState.singleVenue![0].venueName,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Per Plate: ${venueState.singleVenue![0].perPlate}",
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                // Venue Location
                Text(
                  venueState.singleVenue![0].location,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                // Ratings based on the simulated ratings
                Row(
                  children: ratings.map((rating) {
                    return Icon(
                      Icons.star,
                      size: 20.0 + (rating * 2.0),
                      color: Colors.yellow,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                // Venue Information section
                const Text(
                  "Venue Information",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                // Display Venue Information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: venueInfo.map((info) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 23,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          info,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Reviews Section
          const SizedBox(height: 2),
          const Padding(
            padding: EdgeInsets.all(13),
            child: Text(
              "Reviews",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

// List of Reviews with User Profiles
          ListView.builder(
            shrinkWrap: true,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(reviews[index]['profilePic']),
                  radius: 20, // Increase the size of the profile picture
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          reviews[index]['user'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow),
                            const SizedBox(width: 4),
                            Text(
                              reviews[index]['rating'].toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //const SizedBox(height: 8),
                    Text(
                      reviews[index]['review'],
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              );
            },
          ),

          // Reviews Section (Existing code remains the same)

          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.chatwithUsRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Chat With Us',
                    style: TextStyle(fontSize: 25), // Adjust the font size
                  ),
                ),
                const SizedBox(height: 10), 
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.checkAvailabilityRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Check Availability',
                    style: TextStyle(fontSize: 25), // Adjust the font size
                  ),
                ),
                const SizedBox(height: 10), // Add spacing between the buttons
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the booking screen and pass the venue ID as an argument
                    Navigator.pushNamed(
                      context,
                      AppRoute.bookingRoute,
                      arguments: venueState.singleVenue![0].venueId,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Booking',
                    style: TextStyle(fontSize: 25), // Adjust the font size
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
