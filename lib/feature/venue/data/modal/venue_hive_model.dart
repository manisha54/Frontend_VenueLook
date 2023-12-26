import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

import '../../../../config/constants/hive_table_constant.dart';

part 'venue_hive_model.g.dart';

final venueHiveModelProvider = Provider(
  (ref) => VenueHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.venueTableId)
class VenueHiveModel {
  @HiveField(0)
  final String venueId;

  @HiveField(1)
  final String venueName;

  @HiveField(2)
  final String location;
  
  @HiveField(3)
  final String established;
  
  @HiveField(4)
  final String advancePayment;
  
  @HiveField(5)
  final String spacePreference;

  @HiveField(6)
  final String venueType;

  @HiveField(7)
  final String venueHallCapacity;

  @HiveField(8)
  final String contactNumber;

  @HiveField(9)
  final String picture;

  @HiveField(10)
  final String perPlate;

  // empty constructor
  VenueHiveModel.empty() : this(venueId: '', venueName: '',  location: '', established: '', advancePayment: '', spacePreference: '', venueType: '', venueHallCapacity: '' , contactNumber: '', perPlate:'', picture: '');

  VenueHiveModel({
    String? venueId,
    required this.venueName,
    required this. location,
    required this. established,
    required this. advancePayment,
    required this. spacePreference,
    required this. venueType,
    required this. venueHallCapacity,
    required this. contactNumber,
        required this. perPlate,
    required this. picture
  }) : venueId = venueId ?? const Uuid().v4();

  // Convert Hive Object to Entity
  VenueEntity toEntity() => VenueEntity(
        venueId: venueId,
        venueName: venueName,
        location: location,
        established: established,
        advancePayment: advancePayment,
        spacePreference: spacePreference,
        venueType: venueType,
        venueHallCapacity: venueHallCapacity,
        contactNumber: contactNumber,
         perPlate: perPlate,
        picture: picture
      );

  // Convert Entity to Hive Object
  VenueHiveModel toHiveModel(VenueEntity entity) => VenueHiveModel(
        // batchId: entity.batchId,
        venueName: entity.venueName,
        location: entity.location,
        established: entity.established,
        advancePayment: entity.advancePayment,
        spacePreference: entity.spacePreference,
        venueType: entity.venueType,
        venueHallCapacity: entity.venueHallCapacity,
        contactNumber: entity.contactNumber,
           perPlate: entity.perPlate,
        picture: entity.picture
      );

  // Convert Hive List to Entity List
  List<VenueEntity> toEntityList(List<VenueHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'venueId: $venueId, location: $location, established: $established, advancePayment: $advancePayment, spacePreference: $spacePreference , venueName: $venueName , venueType: $venueType, venueHallCapacity: $venueHallCapacity , contactNumber: $contactNumber ,  perPlate: $perPlate, picture: $picture';
  }
}
