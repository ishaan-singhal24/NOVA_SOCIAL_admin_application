// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileNotifier _$ProfileNotifierFromJson(Map<String, dynamic> json) =>
    ProfileNotifier()
      ..totalProfilesCounter = json['totalProfilesCounter'] as int?
      ..waitlistCounter = json['waitlistCounter'] as int?
      ..onboardedCounter = json['onboardedCounter'] as int?
      ..globalInterests = (json['globalInterests'] as List<dynamic>?)
          ?.map((e) => NovaInterests.fromJson(e as Map<String, dynamic>))
          .toList()
      ..globalOpportunities = (json['globalOpportunities'] as List<dynamic>?)
          ?.map((e) => NovaOpportunities.fromJson(e as Map<String, dynamic>))
          .toList()
      ..globalCountries = (json['globalCountries'] as List<dynamic>?)
          ?.map((e) => UserDreamCountry.fromJson(e as Map<String, dynamic>))
          .toList()
      ..globalCareers = (json['globalCareers'] as List<dynamic>?)
          ?.map((e) => UserDreamCareer.fromJson(e as Map<String, dynamic>))
          .toList()
      ..globalColleges = (json['globalColleges'] as List<dynamic>?)
          ?.map((e) => UserDreamCollege.fromJson(e as Map<String, dynamic>))
          .toList()
      ..globalCities = (json['globalCities'] as List<dynamic>?)
          ?.map((e) => UserLocation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..filterProfiles = (json['filterProfiles'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..allProfiles = (json['allProfiles'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..waitlistedProfiles = (json['waitlistedProfiles'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..currentUserProfile = json['currentUserProfile'] == null
          ? null
          : UserModel.fromJson(
              json['currentUserProfile'] as Map<String, dynamic>)
      ..profileByUsername = json['profileByUsername'] == null
          ? null
          : UserModel.fromJson(
              json['profileByUsername'] as Map<String, dynamic>)
      ..fetchFilterProfileStatus = $enumDecodeNullable(
          _$InitEnumEnumMap, json['fetchFilterProfileStatus']);

Map<String, dynamic> _$ProfileNotifierToJson(ProfileNotifier instance) =>
    <String, dynamic>{
      'totalProfilesCounter': instance.totalProfilesCounter,
      'waitlistCounter': instance.waitlistCounter,
      'onboardedCounter': instance.onboardedCounter,
      'globalInterests':
          instance.globalInterests?.map((e) => e.toJson()).toList(),
      'globalOpportunities':
          instance.globalOpportunities?.map((e) => e.toJson()).toList(),
      'globalCountries':
          instance.globalCountries?.map((e) => e.toJson()).toList(),
      'globalCareers': instance.globalCareers?.map((e) => e.toJson()).toList(),
      'globalColleges':
          instance.globalColleges?.map((e) => e.toJson()).toList(),
      'globalCities': instance.globalCities?.map((e) => e.toJson()).toList(),
      'filterProfiles':
          instance.filterProfiles?.map((e) => e.toJson()).toList(),
      'allProfiles': instance.allProfiles?.map((e) => e.toJson()).toList(),
      'waitlistedProfiles':
          instance.waitlistedProfiles?.map((e) => e.toJson()).toList(),
      'currentUserProfile': instance.currentUserProfile?.toJson(),
      'profileByUsername': instance.profileByUsername?.toJson(),
      'fetchFilterProfileStatus':
          _$InitEnumEnumMap[instance.fetchFilterProfileStatus],
    };

const _$InitEnumEnumMap = {
  InitEnum.uninitialized: 'uninitialized',
  InitEnum.initializing: 'initializing',
  InitEnum.initialized: 'initialized',
};
