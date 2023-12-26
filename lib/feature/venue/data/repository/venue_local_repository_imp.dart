import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/core/failure/failure.dart';
import 'package:venue_look/feature/venue/data/data_sources/venue_local_data_source.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';
import 'package:venue_look/feature/venue/domain/repository/venue_repository.dart';


final venueLocalRepoProvider = Provider<IVenueRepository>((ref) {
  return VenueLocalRepositoryImpl(
    venueLocalDataSource: ref.read(venueLocalDataSourceProvider),
  );
});
class VenueLocalRepositoryImpl implements IVenueRepository{

final VenueLocalDataSource venueLocalDataSource;

  VenueLocalRepositoryImpl({
    required this.venueLocalDataSource,
  });

  @override
  Future<Either<Failure, List<VenueEntity>>> getAllVenuesById(String venueId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<VenueEntity>>> venues() {
      return venueLocalDataSource.venues();
  }
  
  @override
  Future<Either<Failure, bool>> addVenue(VenueEntity venue) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadVenuePicture(File file,) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> deleteVenue(String venueId) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> updateVenue(String venueId, VenueEntity venue) {
    throw UnimplementedError();
  }

}