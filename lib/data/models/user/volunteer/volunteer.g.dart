// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Volunteer _$VolunteerFromJson(Map<String, dynamic> json) => Volunteer(
      id: json['id'] as String?,
      title: json['title'] as String?,
      organization: json['organization'] as String?,
      website: json['website'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      description: json['description'] as String?,
      currentlyVolunteering: json['currentlyVolunteering'] as bool?,
    );

Map<String, dynamic> _$VolunteerToJson(Volunteer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'organization': instance.organization,
      'website': instance.website,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'description': instance.description,
      'currentlyVolunteering': instance.currentlyVolunteering,
    };
