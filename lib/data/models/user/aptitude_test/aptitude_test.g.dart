// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aptitude_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AptitudeTest _$AptitudeTestFromJson(Map<String, dynamic> json) => AptitudeTest(
      id: json['id'] as String?,
      name: json['name'] as String?,
      issuedBy: json['issuedBy'] as String?,
      website: json['website'] as String?,
      issueDate:
          const TimestampConverter().fromJson(json['issueDate'] as Timestamp?),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AptitudeTestToJson(AptitudeTest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'issuedBy': instance.issuedBy,
      'website': instance.website,
      'issueDate': const TimestampConverter().toJson(instance.issueDate),
      'description': instance.description,
    };
