import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

import '../../../../core/failure/failure.dart';
import '../repository/venue_repository.dart';

final venueUsecaseProvider = Provider<VenueUseCase>(
  (ref) => VenueUseCase(
    venueRepository: ref.watch(venueRepositoryProvider),
  ),
);

class VenueUseCase {
  final IVenueRepository venueRepository;

  VenueUseCase({required this.venueRepository});

  Future<Either<Failure, List<VenueEntity>>> venues() {
    return venueRepository.venues();
  }

  Future<Either<Failure, List<VenueEntity>>> getAllVenuesById(String venueId) {
    return venueRepository.getAllVenuesById(venueId);
  }

  Future<Either<Failure, bool>> addVenue(VenueEntity venue) {
    return venueRepository.addVenue(venue);
  }

   Future<Either<Failure, String>> uploadVenuePicture(File file) async {
    return await venueRepository.uploadVenuePicture(file);
  }
  Future<Either<Failure, bool>> deleteVenue(String venueId) async {
    return venueRepository.deleteVenue(venueId);
  }
  Future<Either<Failure, bool>> updateVenue(String venueId, VenueEntity venue) async {
    return venueRepository.updateVenue(venueId, venue);
  }
}
