// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_invite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInviteModel _$UserInviteModelFromJson(Map<String, dynamic> json) =>
    UserInviteModel(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      userProfileImageUrl: json['userProfileImageUrl'] as String?,
      username: json['username'] as String?,
      inviteCode: json['inviteCode'] as String?,
    );

Map<String, dynamic> _$UserInviteModelToJson(UserInviteModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'userProfileImageUrl': instance.userProfileImageUrl,
      'username': instance.username,
      'inviteCode': instance.inviteCode,
    };
