import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';
import 'package:venue_look/feature/venue/presentation/viewmodel/venue_view_model.dart';

import '../../../../config/constants/api_endpoint.dart';

class VenueWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<VenueEntity> venueList;

  const VenueWidget({Key? key, required this.ref, required this.venueList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var venuestate = ref.watch(venueViewModelProvider);
    return GridView.builder(
      itemCount: venueList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(9.0),
          child: InkWell(
            onTap: () {
              ref
                  .read(venueViewModelProvider.notifier)
                  .getVenueById(context, venueList[index].venueId!);
            },
            child: SizedBox(
              height: 350, // Limit the height of each card
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
                          child: Image.network(
                            ApiEndpoints.imageUrl +
                                venuestate.venues[index].picture,
                            fit: BoxFit.cover,
                            height: 280, // Set the image height
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    venueList[index].venueName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Per Plate ${venueList[index].perPlate}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                venueList[index].location,
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
                          size: 30,
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
          ),
        );
      },
    );
  }
}
