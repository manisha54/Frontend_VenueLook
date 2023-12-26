import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/venue_local_repository_imp.dart';
import '../../data/repository/venue_remote_repository_impl.dart';

final venueRepositoryProvider = Provider<IVenueRepository>(
  (ref) {
    // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    if (ConnectivityStatus.isConnected == internetStatus) {
      // If internet is available then return remote repo
      return ref.watch(venueRemoteRepoProvider);
    } else {
      // If internet is not available then return local repo
      return ref.watch(venueLocalRepoProvider);
    }

    //  return VenueRemoteRepositoryImpl(venueRemoteDataSource: ref.read(venueRemoteDataSourceProvider));
    // return VenueLocalRepositoryImpl(venueLocalDataSource: ref.read(venueLocalDataSourceProvider));
  },
);

abstract class IVenueRepository {
  Future<Either<Failure, List<VenueEntity>>> venues();
  Future<Either<Failure, List<VenueEntity>>> getAllVenuesById(String venueId);
  Future<Either<Failure, bool>> addVenue(VenueEntity venue);
  Future<Either<Failure, String>> uploadVenuePicture(File file);
  Future<Either<Failure, bool>> deleteVenue(String venueId);
    Future<Either<Failure, bool>> updateVenue(String venueId, VenueEntity venue);
}
