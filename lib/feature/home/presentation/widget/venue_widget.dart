import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';
import 'package:venue_look/feature/venue/presentation/viewmodel/venue_view_model.dart';

import '../../../../config/constants/api_endpoint.dart';

class VenueWidget extends StatelessWidget {
  final WidgetRef ref;
  final List<VenueEntity> venueList;
  const VenueWidget({super.key, required this.ref, required this.venueList});
  @override
  Widget build(BuildContext context) {
    var venuestate = ref.watch(venueViewModelProvider);
    return GridView.builder(
      // Put this otherwise it will take all the space
      shrinkWrap: true,
      itemCount: venueList.length,
      //  scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            onTap: () {
              ref
                  .read(venueViewModelProvider.notifier)
                  .getVenueById(context, venueList[index].venueId!);
            },
            child: Card(
              //  color: Colors.green[100],
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        ApiEndpoints.imageUrl +
                            venuestate.venues[index].picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      venueList[index].venueName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      venueList[index].location,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'PerPlate ${venueList[index].perPlate}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 18,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.red),
                        onRatingUpdate: (index) {}),              
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
