// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersInfoDTO _$GetUsersInfoDTOFromJson(Map<String, dynamic> json) =>
    GetUsersInfoDTO(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUsersInfoDTOToJson(GetUsersInfoDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
