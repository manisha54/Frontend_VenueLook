import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String? reviewId;
  final String text;
  final String userId;
  final String userName;

  const ReviewEntity({
    this.reviewId,
    required this.text,
    required this.userId,
    required this.userName,
  });

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => ReviewEntity(
        reviewId: json["reviewId"],
        text: json["text"],
        userId: json["userId"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "reviewId": reviewId,
        "text": text,
        "useId": userId,
        "userName": userName
      };

  @override
  List<Object?> get props => [reviewId, text, userId, userName];
}
