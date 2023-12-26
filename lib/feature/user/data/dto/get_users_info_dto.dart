
import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/user/data/modal/user_api_model.dart';

part 'get_users_info_dto.g.dart';

@JsonSerializable()
class GetUsersInfoDTO {
  final bool success;
  final List<UserApiModel> data;

  GetUsersInfoDTO({
    required this.success,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetUsersInfoDTOToJson(this);

  factory GetUsersInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUsersInfoDTOFromJson(json);
}


