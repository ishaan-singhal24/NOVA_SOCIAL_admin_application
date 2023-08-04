import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novasocial_admin/data/models/misc/converters/converters.dart';
import 'package:novasocial_admin/data/models/user/export.dart';
part 'user_collection.freezed.dart';
part 'user_collection.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class UserCollection with _$UserCollection {
  const factory UserCollection({
    String? id,
    String? name,
    String? tagline,
    String? iconUrl,
    @ColorConverter() Color? color,
    List<UserCollectionItem>? item,
  }) = _UserCollection;

  factory UserCollection.fromJson(Map<String, dynamic> json) =>
      _$UserCollectionFromJson(json);
}
