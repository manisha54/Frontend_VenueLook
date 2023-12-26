import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final String? bookingId;
  final String time;
  final String date;
  final String fullName;
  final String contactNumber;

  // final VenueEntity? venue;

  const BookingEntity(
      {this.bookingId,
      required this.date,
      required this.time,
      required this.fullName,
      required this.contactNumber});

  factory BookingEntity.fromJson(Map<String, dynamic> json) => BookingEntity(
        bookingId: json["bookingId"],
        date: json["date"],
        time: json["time"],
        fullName: json["fullName"],
        contactNumber: json["contactNumber"],
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "date": date,
        "time": time,
        "fullName": fullName,
        "contactNumber": contactNumber
      };

  @override
  List<Object?> get props =>
      [bookingId, date, time,contactNumber, fullName];
}
