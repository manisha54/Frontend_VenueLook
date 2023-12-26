import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:venue_look/feature/user/data/modal/user_hive_model.dart';
import 'package:venue_look/feature/venue/data/modal/venue_hive_model.dart';
import '../../../config/constants/hive_table_constant.dart';

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(UserHiveModelAdapter());
    Hive.registerAdapter(VenueHiveModelAdapter());
  }

  // ======================== User Queries ========================
  Future<void> addUser(UserHiveModel user) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.put(user.userId, user);
  }

  Future<List<UserHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var students = box.values.toList();
    box.close();
    return students;
  }

  //Login
  Future<UserHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
        element.email == email && element.password == password);
    box.close();
    return user;
  }


  // ======================== venue Queries ========================


  Future<List<VenueHiveModel>> venues() async {
    var box = await Hive.openBox<VenueHiveModel>(HiveTableConstant.venueBox);
    var venues = box.values.toList();
    box.close();
    return venues;
  }









  // ======================== Delete All Data ========================
  Future<void> deleteAllData() async {
    var box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.clear();
  }



  // ======================== Close Hive ========================
  Future<void> closeHive() async {
    await Hive.close();
  }

  // ======================== Delete Hive ========================
  Future<void> deleteHive() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    await Hive.deleteFromDisk();
  }
}
