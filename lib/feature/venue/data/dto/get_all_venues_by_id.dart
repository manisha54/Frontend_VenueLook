import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/venue/data/modal/venue_api_model.dart';

part 'get_all_venues_by_id.g.dart';

@JsonSerializable()
class GetAllVenuesByIdDTO {
  final bool success;
  final List<VenueApiModel> data;

  GetAllVenuesByIdDTO({
    required this.success,
    required this.data,
  });

  factory GetAllVenuesByIdDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllVenuesByIdDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllVenuesByIdDTOToJson(this);
}
