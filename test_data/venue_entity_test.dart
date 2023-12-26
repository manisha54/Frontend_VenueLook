import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

Future<List<VenueEntity>> getVenueListTest() async {
  final response =
      await rootBundle.loadString('test_data/venue_test_data.json');
  final jsonList = await json.decode(response);
  final List<VenueEntity> venueList = jsonList
      .map<VenueEntity>(
        (json) => VenueEntity.fromJson(json),
      )
      .toList();

  return Future.value(venueList);
}


