import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';

Future<List<BookingEntity>> getBookingListTest() async {
  final response =
      await rootBundle.loadString('test_data/booking_test_data.json');
  final jsonList = await json.decode(response);
  final List<BookingEntity> bookingList = jsonList
      .map<BookingEntity>(
        (json) => BookingEntity.fromJson(json),
      )
      .toList();

  return Future.value(bookingList);
}


