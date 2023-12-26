// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      userId: json['id'] as String?,
      fName: json['fName'] as String,
      lName: json['lName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'fName': instance.fName,
      'lName': instance.lName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
