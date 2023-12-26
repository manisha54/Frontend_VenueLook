// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewApiModel _$ReviewApiModelFromJson(Map<String, dynamic> json) =>
    ReviewApiModel(
      reviewId: json['id'] as String?,
      text: json['text'] as String,
      userId: json['userId'] as String?,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$ReviewApiModelToJson(ReviewApiModel instance) =>
    <String, dynamic>{
      'id': instance.reviewId,
      'text': instance.text,
      'userId': instance.userId,
      'userName': instance.userName,
    };
