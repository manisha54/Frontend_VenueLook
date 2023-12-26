// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      bookingId: json['id'] as String?,
      time: json['time'] as String,
      date: json['date'] as String,
      fullName: json['fullName'] as String?,
      contactNumber: json['contactNumber'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.bookingId,
      'time': instance.time,
      'date': instance.date,
      'fullName': instance.fullName,
      'contactNumber': instance.contactNumber,
    };
