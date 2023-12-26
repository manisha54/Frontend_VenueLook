import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

class VenueState {
  final bool isLoading;
  final List<VenueEntity> venues;
  final List<VenueEntity>? singleVenue;

  final String? error;
  final String? imageName;

  VenueState(
      {required this.isLoading,
      required this.venues,
      this.error,
      this.singleVenue,
      this.imageName});

  factory VenueState.initial() {
    return VenueState(
        isLoading: false, venues: [], singleVenue: [], imageName: null);
  }

  VenueState copyWith({
    bool? isLoading,
    List<VenueEntity>? venues,
    String? error,
    String? imageName,
    List<VenueEntity>? singleVenue,
  }) {
    return VenueState(
      isLoading: isLoading ?? this.isLoading,
      venues: venues ?? this.venues,
      singleVenue: singleVenue ?? this.singleVenue,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
    );
  }
}
