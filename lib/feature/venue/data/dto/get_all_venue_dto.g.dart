// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_venue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllVenueDTO _$GetAllVenueDTOFromJson(Map<String, dynamic> json) =>
    GetAllVenueDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => VenueApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllVenueDTOToJson(GetAllVenueDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
