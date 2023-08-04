// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Award _$AwardFromJson(Map<String, dynamic> json) => Award(
      id: json['id'] as String?,
      name: json['name'] as String?,
      website: json['website'] as String?,
      issuedBy: json['issuedBy'] as String?,
      issueDate:
          const TimestampConverter().fromJson(json['issueDate'] as Timestamp?),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AwardToJson(Award instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'website': instance.website,
      'issuedBy': instance.issuedBy,
      'issueDate': const TimestampConverter().toJson(instance.issueDate),
      'description': instance.description,
    };
