
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/user/domain/entity/user_entity.dart';

part 'user_api_model.g.dart';


final userApiModelProvider = Provider<UserApiModel>((ref) {
  return UserApiModel(
    fName: '',
    lName: '',
    email: '',
    phoneNumber: '',
    password: '',
  );
});

@JsonSerializable()
class UserApiModel {
  @JsonKey(name: 'id')
  final String? userId;
  final String fName;
  final String lName;
  final String email;
  final String phoneNumber;
  final String? password;

  UserApiModel({
    this.userId,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phoneNumber,
    this.password,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  // convert UserApiModel to UserEntity
  UserEntity toEntity() => UserEntity(
        id: userId,
        fName: fName,
        lName: lName,
        email: email,
        phoneNumber: phoneNumber,
        password: password ?? '',
      );

  // Convert AuthApiModel list to AuthEntity list
  List<UserEntity> listFromJson(List<UserApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'UserApiModel(id: $userId, fName: $fName, lName: $lName, email: $email, phoneNumber: $phoneNumber,p assword: $password)';
  }
}
