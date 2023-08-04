// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      school: json['school'] as String?,
      degree: json['degree'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      fieldOfStudy: json['fieldOfStudy'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      currentlyStudyHere: json['currentlyStudyHere'] as bool?,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'school': instance.school,
      'degree': instance.degree,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'fieldOfStudy': instance.fieldOfStudy,
      'description': instance.description,
      'location': instance.location,
      'currentlyStudyHere': instance.currentlyStudyHere,
    };
