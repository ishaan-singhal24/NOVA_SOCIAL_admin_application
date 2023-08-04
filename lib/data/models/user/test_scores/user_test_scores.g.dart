// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_test_scores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTestScores _$UserTestScoresFromJson(Map<String, dynamic> json) =>
    UserTestScores(
      id: json['id'] as String?,
      testName: json['testName'] as String?,
      conductedBy: json['conductedBy'] as String?,
      website: json['website'] as String?,
      testIconUrl: json['testIconUrl'] as String?,
      scoredMarks: json['scoredMarks'] as String?,
      maxMarks: json['maxMarks'] as String?,
      relatedLink: json['relatedLink'] as String?,
      testDate:
          const TimestampConverter().fromJson(json['testDate'] as Timestamp?),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserTestScoresToJson(UserTestScores instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testName': instance.testName,
      'conductedBy': instance.conductedBy,
      'website': instance.website,
      'testIconUrl': instance.testIconUrl,
      'scoredMarks': instance.scoredMarks,
      'maxMarks': instance.maxMarks,
      'relatedLink': instance.relatedLink,
      'description': instance.description,
      'testDate': const TimestampConverter().toJson(instance.testDate),
    };
