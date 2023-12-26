// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBookingDTO _$GetAllBookingDTOFromJson(Map<String, dynamic> json) =>
    GetAllBookingDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBookingDTOToJson(GetAllBookingDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
