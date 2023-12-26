import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

import '../../../../config/constants/hive_table_constant.dart';

part 'user_hive_model.g.dart';

final userHiveModelProvider = Provider(
  (ref) => UserHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String fName;

  @HiveField(2)
  final String lName;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phoneNumber;

  @HiveField(5)
  final String password;

  // Constructor
  UserHiveModel({
    String? userId,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  UserHiveModel.empty()
      : this(
          userId: '',
          fName: '',
          lName: '',
          email: '',
          phoneNumber: '',
          password: '',
        );

  // Convert Hive Object to Entity
  UserEntity toEntity() => UserEntity(
        id: userId,
        fName: fName,
        lName: lName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );

  // Convert Entity to Hive Object
  UserHiveModel toHiveModel(UserEntity entity) => UserHiveModel(
        userId: const Uuid().v4(),
        fName: entity.fName,
        lName: entity.lName,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<UserHiveModel> toHiveModelList(List<UserEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, fName: $fName, lName: $lName, email: $email,phoneNumber: $phoneNumber, password: $password';
  }
}
