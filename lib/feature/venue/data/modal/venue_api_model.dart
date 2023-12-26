import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

part 'venue_api_model.g.dart';

final venueApiModelProvider = Provider<VenueApiModel>(
  (ref) => const VenueApiModel.empty(),
);

@JsonSerializable()
class VenueApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String? venueId;
  final String venueName;
  final String location;
  final String established;
  final String? advancePayment;
  final String? spacePreference;
  final String? venueType;
  final String? venueHallCapacity;
  final String? contactNumber;
  final String? picture;
  final String? perPlate;

  const VenueApiModel(
      {required this.venueId,
      required this.venueName,
      required this.location,
      required this.established,
      required this.advancePayment,
      required this.spacePreference,
      required this.venueType,
      required this.venueHallCapacity,
      required this.contactNumber,
      required this.perPlate,
      this.picture});
  const VenueApiModel.empty()
      : venueId = '',
        venueName = '',
        location = '',
        established = '',
        advancePayment = '',
        spacePreference = '',
        venueType = '',
        venueHallCapacity = '',
        contactNumber = '',
        perPlate = '',
        picture = '';

  Map<String, dynamic> toJson() => _$VenueApiModelToJson(this);

  factory VenueApiModel.fromJson(Map<String, dynamic> json) =>
      _$VenueApiModelFromJson(json);

  // Convert API Object to Entity
  VenueEntity toEntity() => VenueEntity(
      venueId: venueId,
      venueName: venueName,
      location: location,
      established: established,
      advancePayment: advancePayment ?? '',
      spacePreference: spacePreference ?? '',
      venueType: venueType ?? '',
      venueHallCapacity: venueHallCapacity ?? '',
      contactNumber: contactNumber ?? '',
      perPlate: perPlate ?? '',
      picture: picture ?? '');

  // Convert Entity to API Object
  VenueApiModel fromEntity(VenueEntity entity) => VenueApiModel(
      venueId: entity.venueId ?? '',
      venueName: entity.venueName,
      location: entity.location,
      established: entity.established,
      advancePayment: entity.advancePayment,
      spacePreference: entity.spacePreference,
      venueType: entity.venueType,
      venueHallCapacity: entity.venueHallCapacity,
      contactNumber: entity.contactNumber,
      perPlate: entity.perPlate,
      picture: entity.picture);

  // Convert API List to Entity List
  List<VenueEntity> toEntityList(List<VenueApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  // Convert VenueApiModel list to VenueEntity list
  List<VenueEntity> listFromJson(List<VenueApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  VenueEntity fromJsonSingle(VenueApiModel singleVenue) =>
      singleVenue.toEntity();

  @override
  List<Object?> get props => [
        venueId,
        venueName,
        location,
        established,
        advancePayment,
        spacePreference,
        venueType,
        venueHallCapacity,
        contactNumber,
        picture,
        perPlate
      ];
}
