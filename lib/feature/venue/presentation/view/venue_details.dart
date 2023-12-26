import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/presentation/viewmodel/venue_view_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../config/router/app_route.dart';

class VenueDetailsView extends ConsumerStatefulWidget {
  const VenueDetailsView({super.key});

  @override
  ConsumerState<VenueDetailsView> createState() => _VenueDetailsViewState();
}

class _VenueDetailsViewState extends ConsumerState<VenueDetailsView> {
  SizedBox gap = const SizedBox(height: 10);
  @override
  Widget build(BuildContext context) {
    var venueState = ref.watch(venueViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Venue Details"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xffff66c4),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: venueState.venues.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: 2000,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.network(
                          ApiEndpoints.imageUrl +
                              venueState.singleVenue![index].picture,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              venueState.singleVenue![index].venueName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.bookingRoute,
                                      arguments:
                                          venueState.venues[index].venueId);
                                },
                                child: const Text(
                                  "Book venue",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "location : ${venueState.singleVenue![index].location}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,
                            const Divider(color: Color(0xffC0C0C0)),
                            Text(
                              "Contact Number : ${venueState.singleVenue![index].contactNumber}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,
                            const Divider(color: Color(0xffC0C0C0)),
                            Text(
                              "Established : ${venueState.singleVenue![index].established}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,
                            const Divider(color: Color(0xffC0C0C0)),
                            Text(
                              "Space preference : ${venueState.singleVenue![index].spacePreference}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,
                            const Divider(color: Color(0xffC0C0C0)),
                            Text(
                              "Venue type : ${venueState.singleVenue![index].venueType}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,
                            const Divider(color: Color(0xffC0C0C0)),
                            Text(
                              "Venue Hall Capacity : ${venueState.singleVenue![index].venueHallCapacity}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,
                            const Divider(color: Color(0xffC0C0C0)),

                            Text(
                              "Avance payment : ${venueState.singleVenue![index].advancePayment}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,
                            Text(
                              "PerPlate : ${venueState.singleVenue![index].perPlate}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            gap,

                            //review
                            const SizedBox(height: 10),
                            const Divider(color: Color(0xffC0C0C0)),
                            const SizedBox(height: 10),
                            const Text(
                              "Add your review",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(6),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                maxLines: null,
                                minLines: 2,
                                decoration: InputDecoration(
                                    labelText: "  Type your review",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.5),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.pink,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 1.0)),
                              ),
                            ),
                            gap,
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Add review",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            gap,
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                                "Are you sure want to delete ${venueState.singleVenue![index].venueName}"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('No')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    ref
                                                        .read(
                                                            venueViewModelProvider
                                                                .notifier)
                                                        .deleteVenue(
                                                            context,
                                                            venueState
                                                                    .singleVenue![
                                                                index]);
                                                  },
                                                  child: const Text('Yes')),
                                            ],
                                          ));
                                },
                                child: const Text(
                                  "delete venue",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "View All review",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            gap,
                            // gap,
                            // ListView.builder(
                            //   itemBuilder: itemBuilder)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
