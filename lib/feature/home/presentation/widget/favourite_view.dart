import 'package:flutter/material.dart';

class Venue {
  final String picture;
  final String venueName;
  final String perPlate;
  final String location;
  final String venueId;

  Venue({
    required this.picture,
    required this.venueName,
    required this.perPlate,
    required this.location,
    required this.venueId,
  });
}

class FavouriteView extends StatelessWidget {
   FavouriteView({Key? key}) : super(key: key);

  final List<Venue> venueList = [
    Venue(
      picture: 'assets/images/durbar.jpg',
      venueName: 'Smart banquet',
      perPlate: '1000',
      location: 'Anamnagar',
      venueId: '1',
    ),
    Venue(
      picture: 'assets/images/naulo.jpg',
      venueName: 'Naulo banquet',
      perPlate: '10000',
      location: 'Baneshwor',
      venueId: '2',
    ),
    // Add more venues as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Custom toolbar height
        child: AppBar(
          title: const Text("Favourite"),
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
        child: GridView.builder(
          itemCount: venueList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Number of columns in the grid (1 for vertical)
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemBuilder: (context, index) {
            final venue = venueList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 350,
                child: Card(
                  elevation: 5,
                  color: const Color(0xFFE5E7EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                             borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15)),
                          //  color: Colors.blue, // Set a background color for visibility
                            child: Image.asset(
                              venue.picture,
                              fit: BoxFit.cover,
                              height: 280,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      venue.venueName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Per Plate ${venue.perPlate}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  venue.location,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 20,
                          ),
                          onPressed: () {
                            // Implement your logic for adding to favorites here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(
     MaterialApp(
      home: FavouriteView(),
    ),
  );
}
