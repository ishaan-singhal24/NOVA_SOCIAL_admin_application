import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:novasocial_admin/data/models/misc/converters/timestamp_converter.dart';
part 'award.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Award {
  String? id;
  String? name;
  String? website;
  String? issuedBy;
  @TimestampConverter()
  DateTime? issueDate;
  String? description;

  Award({
    this.id,
    this.name,
    this.website,
    this.issuedBy,
    this.issueDate,
    this.description,
  });

  factory Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);

  Map<String, dynamic> toJson() => _$AwardToJson(this);
}
