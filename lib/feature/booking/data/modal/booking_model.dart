import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/booking/domain/entity/booking_entity.dart';

part 'booking_model.g.dart';

final bookingModelProvider = Provider<BookingModel>(
  (ref) => const BookingModel.empty(),
);

@JsonSerializable()
class BookingModel extends Equatable {
  @JsonKey(name: 'id')
  final String? bookingId;
  final String time;
  final String date;
  final String? fullName;
  final String? contactNumber;

  const BookingModel(
      {this.bookingId,
      required this.time,
      required this.date,
      required this.fullName,
      required this.contactNumber});

  const BookingModel.empty()
      : bookingId = '',
        date = '',
        time = '',
        fullName = '',
        contactNumber = '';

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  // Convert API Object to Entity
  BookingEntity toEntity() => BookingEntity(
      bookingId: bookingId,
      time: time,
      date: date,
      fullName: fullName ?? '',
      contactNumber: contactNumber ??'');

  // Convert Entity to API Object
  BookingModel fromEntity(BookingEntity entity) => BookingModel(
      bookingId: entity.bookingId ?? '',
      date: entity.date,
      time: entity.time,
      fullName: entity.fullName,
      contactNumber: entity.contactNumber);

  // Convert API List to Entity List
  List<BookingEntity> toEntityList(List<BookingModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props =>
      [bookingId, date, time, contactNumber, fullName];
}
