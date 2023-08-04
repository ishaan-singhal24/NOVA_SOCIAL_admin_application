import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:novasocial_admin/data/enums/experience_subtag.dart';
import 'package:novasocial_admin/data/models/misc/converters/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'experience.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Experience {
  String? company;
  String? website;
  String? jobTitle;
  @TimestampConverter()
  DateTime? startDate;
  @TimestampConverter()
  DateTime? endDate;
  bool? currentlyWorkingHere;
  String? description;
  String? location;
  ExperienceSubtag? subTag;

  Experience({
    this.company,
    this.website,
    this.jobTitle,
    this.startDate,
    this.endDate,
    this.description,
    this.location,
    this.currentlyWorkingHere,
    this.subTag,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
