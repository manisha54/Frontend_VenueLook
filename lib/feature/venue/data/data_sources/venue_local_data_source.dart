import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venue_look/feature/venue/domain/entity/venue_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../modal/venue_hive_model.dart';

// Dependency Injection using Riverpod
final venueLocalDataSourceProvider = Provider<VenueLocalDataSource>((ref) {
  return VenueLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      venueHiveModel: ref.read(venueHiveModelProvider));
});

class VenueLocalDataSource {
  final HiveService hiveService;
  final VenueHiveModel venueHiveModel;

  VenueLocalDataSource({
    required this.hiveService,
    required this.venueHiveModel,
  });


//getallvenue
  Future<Either<Failure, List<VenueEntity>>> venues() async {
    try {
      // Get all venues from Hive
      final venues = await hiveService.venues();
      // Convert Hive Object to Entity
      final venueEntities = venueHiveModel.toEntityList(venues);
      return Right(venueEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
