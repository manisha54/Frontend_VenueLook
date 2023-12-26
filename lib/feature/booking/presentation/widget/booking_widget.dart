import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/config/router/app_route.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/presentation/viewmodel/booking_view_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../venue/domain/entity/venue_entity.dart';
import '../../../venue/presentation/viewmodel/venue_view_model.dart';

class BookingWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<BookingEntity> bookingList;
  final List<VenueEntity> venueList;
  const BookingWidget(
      {super.key,
      required this.ref,
      required this.bookingList,
      required this.venueList});

  @override
  Widget build(BuildContext context) {
    var bookingstate = ref.watch(bookingViewModelProvider);
    var venuestate = ref.watch(venueViewModelProvider);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          if (bookingstate.isLoading) ...{
            const CircularProgressIndicator(),
          } else if (bookingstate.error != null) ...{
            Text(bookingstate.error!),
          } else if (bookingstate.bookings.isEmpty) ...{
            const Center(
              child: Text(
                "No  yet bookings",
                style: TextStyle(fontSize: 25),
              ),
            ),
          } else ...{
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          color: Colors.grey,
                          height: 8,
                        ),
                    itemCount: bookingList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onDoubleTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Wrap(
                                        children: [
                                          Text(
                                              'Do you want to delete ${venueList[index].venueName}?'),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  ref
                                                      .read(
                                                          bookingViewModelProvider
                                                              .notifier)
                                                      .deleteBooking(context,
                                                          bookingList[index]);
                                                },
                                                child: const Text("Yes"),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('No'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
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
                                Image.network(
                                  ApiEndpoints.imageUrl +
                                      venuestate.venues[index].picture,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                ),
                                SizedBox(
                                  width: 190,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        bookingList[index].fullName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        venuestate.venues[index].venueName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        venuestate.venues[index].location,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        bookingList[index].date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        bookingList[index].time,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      
                                      Navigator.pushNamed(context, AppRoute.updateBookingRoute);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          }
        ],
      )),
    );
  }
}
