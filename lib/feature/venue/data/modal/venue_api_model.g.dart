// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueApiModel _$VenueApiModelFromJson(Map<String, dynamic> json) =>
    VenueApiModel(
      venueId: json['id'] as String?,
      venueName: json['venueName'] as String,
      location: json['location'] as String,
      established: json['established'] as String,
      advancePayment: json['advancePayment'] as String?,
      spacePreference: json['spacePreference'] as String?,
      venueType: json['venueType'] as String?,
      venueHallCapacity: json['venueHallCapacity'] as String?,
      contactNumber: json['contactNumber'] as String?,
      perPlate: json['perPlate'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$VenueApiModelToJson(VenueApiModel instance) =>
    <String, dynamic>{
      'id': instance.venueId,
      'venueName': instance.venueName,
      'location': instance.location,
      'established': instance.established,
      'advancePayment': instance.advancePayment,
      'spacePreference': instance.spacePreference,
      'venueType': instance.venueType,
      'venueHallCapacity': instance.venueHallCapacity,
      'contactNumber': instance.contactNumber,
      'picture': instance.picture,
      'perPlate': instance.perPlate,
    };
