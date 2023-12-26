import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/core/failure/failure.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

import '../../domain/repository/venue_repository.dart';
import '../data_sources/venue_remote_data_source.dart';

final venueRemoteRepoProvider = Provider<IVenueRepository>(
  (ref) => VenueRemoteRepositoryImpl(
    venueRemoteDataSource: ref.read(venueRemoteDataSourceProvider),
  ),
);

class VenueRemoteRepositoryImpl implements IVenueRepository {
  final VenueRemoteDataSource venueRemoteDataSource;

  VenueRemoteRepositoryImpl({required this.venueRemoteDataSource});

  @override
  Future<Either<Failure, List<VenueEntity>>> venues() {
    return venueRemoteDataSource.venues();
  }

  @override
  Future<Either<Failure, List<VenueEntity>>> getAllVenuesById(String venueId) {
    return venueRemoteDataSource.getAllVenuesById(venueId);
  }

  @override
  Future<Either<Failure, bool>> addVenue(VenueEntity venue) {
    return venueRemoteDataSource.addVenue(venue);
  }

  @override
  Future<Either<Failure, String>> uploadVenuePicture(
      File file) {
    return venueRemoteDataSource.uploadProfilePicture(file);
  }

  @override
  Future<Either<Failure, bool>> deleteVenue(String venueId) {
    return venueRemoteDataSource.deleteVenue(venueId);
  }
  
  @override
  Future<Either<Failure, bool>> updateVenue(String venueId, VenueEntity venue) {
       return venueRemoteDataSource.updateVenue(venueId, venue);
  }
}
