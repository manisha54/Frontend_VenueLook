// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_venues_by_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllVenuesByIdDTO _$GetAllVenuesByIdDTOFromJson(Map<String, dynamic> json) =>
    GetAllVenuesByIdDTO(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => VenueApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllVenuesByIdDTOToJson(
        GetAllVenuesByIdDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
