import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:novasocial_admin/data/enums/social_platforms.dart';
part 'social.freezed.dart';
part 'social.g.dart';

@freezed
class Social with _$Social {
  const factory Social({
    SocialPlatforms? platform,
    String? url,
  }) = _Social;

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);
}
