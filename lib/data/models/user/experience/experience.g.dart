// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experience _$ExperienceFromJson(Map<String, dynamic> json) => Experience(
      company: json['company'] as String?,
      website: json['website'] as String?,
      jobTitle: json['jobTitle'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      description: json['description'] as String?,
      location: json['location'] as String?,
      currentlyWorkingHere: json['currentlyWorkingHere'] as bool?,
      subTag: $enumDecodeNullable(_$ExperienceSubtagEnumMap, json['subTag']),
    );

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'company': instance.company,
      'website': instance.website,
      'jobTitle': instance.jobTitle,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'currentlyWorkingHere': instance.currentlyWorkingHere,
      'description': instance.description,
      'location': instance.location,
      'subTag': _$ExperienceSubtagEnumMap[instance.subTag],
    };

const _$ExperienceSubtagEnumMap = {
  ExperienceSubtag.Work: 'Work',
  ExperienceSubtag.Leadership: 'Leadership',
  ExperienceSubtag.Athletic: 'Athletic',
};
