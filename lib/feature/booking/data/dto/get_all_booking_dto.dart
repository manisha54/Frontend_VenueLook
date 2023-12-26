import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/booking/data/modal/booking_model.dart';

part 'get_all_booking_dto.g.dart';

@JsonSerializable()
class GetAllBookingDTO {
  final bool success;
  final int count;
  final List<BookingModel> data;

  GetAllBookingDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllBookingDTOToJson(this);

  factory GetAllBookingDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllBookingDTOFromJson(json);
}
