import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/config/constants/api_endpoint.dart';
import 'package:venue_look/config/router/app_route.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';
import 'package:venue_look/feature/booking/presentation/viewmodel/booking_view_model.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';
import 'package:venue_look/feature/venue/presentation/viewmodel/venue_view_model.dart';

class BookingWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<BookingEntity> bookingList;
  final List<VenueEntity> venueList;

  const BookingWidget({
    Key? key,
    required this.ref,
    required this.bookingList,
    required this.venueList,
  }) : super(key: key);

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
                  "No bookings yet",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            } else ...{
              Expanded(
                child: ListView.builder(
                  itemCount: bookingList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
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
                                          'Do you want to delete ${venueList[index].venueName}?',
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                ref
                                                    .read(
                                                      bookingViewModelProvider
                                                          .notifier,
                                                    )
                                                    .deleteBooking(
                                                      context,
                                                      bookingList[index],
                                                    );
                                              },
                                              child: const Text("Yes"),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('No'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  ApiEndpoints.imageUrl +
                                      venuestate.venues[index].picture,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.error),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      bookingList[index].fullName,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      venuestate.venues[index].venueName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    Text(
                                      venuestate.venues[index].location,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    Text(
                                      bookingList[index].date,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    Text(
                                      bookingList[index].time,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    'Do you want to delete ${venueList[index].venueName}?',
                                                  ),
                                                  const SizedBox(height: 25),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.green,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          ref
                                                              .read(
                                                                bookingViewModelProvider
                                                                    .notifier,
                                                              )
                                                              .deleteBooking(
                                                                context,
                                                                bookingList[
                                                                    index],
                                                              );
                                                        },
                                                        child: const Text("Yes"),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Colors.blue,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('No'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  const Text(
                                    'Delete',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoute.updateBookingRoute,
                                      );
                                    },
                                  ),
                                  const Text(
                                    'Edit',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
