import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:venue_look/feature/review/domain/entity/review_entity.dart';

part 'review_api_model.g.dart';

final reviewApiModelProvider = Provider<ReviewApiModel>(
  (ref) => const ReviewApiModel.empty(),
);

@JsonSerializable()
class ReviewApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String? reviewId;
  final String text;
  final String? userId;
  final String userName;

  const ReviewApiModel({
    this.reviewId,
    required this.text,
    this.userId,
    required this.userName,
  });
  const ReviewApiModel.empty()
      : reviewId = '',
        text = '',
        userId = '',
        userName = '';

  Map<String, dynamic> toJson() => _$ReviewApiModelToJson(this);

  factory ReviewApiModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewApiModelFromJson(json);

  // Convert API Object to Entity
  ReviewEntity toEntity() => ReviewEntity(
      reviewId: reviewId, text: text, userId: userId ?? '', userName: userName);

  // Convert Entity to API Object
  ReviewApiModel fromEntity(ReviewEntity entity) => ReviewApiModel(
      reviewId: entity.reviewId ?? '',
      text: entity.text,
      userId: entity.userId,
      userName: entity.userName);

  // Convert API List to Entity List
  List<ReviewEntity> toEntityList(List<ReviewApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [reviewId, text, userId, userName];
}
