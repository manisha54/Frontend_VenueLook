import 'package:equatable/equatable.dart';

class VenueEntity extends Equatable {
  final String? venueId;
  final String venueName;
  final String location;
  final String established;
  final String advancePayment;
  final String spacePreference;
  final String venueType;
  final String venueHallCapacity;
  final String contactNumber;
  final String picture;
  final String perPlate;

  const VenueEntity(
      {this.venueId,
      required this.venueName,
      required this.location,
      required this.established,
      required this.advancePayment,
      required this.spacePreference,
      required this.venueType,
      required this.venueHallCapacity,
      required this.contactNumber,
      required this.picture,
      required this.perPlate});

  factory VenueEntity.fromJson(Map<String, dynamic> json) => VenueEntity(
        venueId: json["venueId"],
        venueName: json["venueName"],
        location: json["location"],
        established: json["established"],
        advancePayment: json["advancePayment"],
        spacePreference: json["spacePreference"],
        venueType: json["venueType"],
        venueHallCapacity: json["venueHallCapacity"],
        contactNumber: json["contactNumber"],
        perPlate: json["perPlate"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "venueId": venueId,
        "venueName": venueName,
        "location": location,
        "established": established,
        "advancePayment": advancePayment,
        "spacePreference": spacePreference,
        "venueType": venueType,
        "venueHallCapacity": venueHallCapacity,
        "contactNumber": contactNumber,
        "perPlate": perPlate,
        "picture": picture,
      };

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
