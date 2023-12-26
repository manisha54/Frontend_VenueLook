import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/venue/data/modal/venue_api_model.dart';


part 'get_all_venue_dto.g.dart';

@JsonSerializable()
class GetAllVenueDTO {
  final bool success;
  final int count;
  final List<VenueApiModel> data;

  GetAllVenueDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllVenueDTOToJson(this);

  factory GetAllVenueDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllVenueDTOFromJson(json);
}
