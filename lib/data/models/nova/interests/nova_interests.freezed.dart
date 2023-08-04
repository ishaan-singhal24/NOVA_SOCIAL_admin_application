// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nova_interests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NovaInterests _$NovaInterestsFromJson(Map<String, dynamic> json) {
  return _NovaInterests.fromJson(json);
}

/// @nodoc
mixin _$NovaInterests {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get docName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NovaInterestsCopyWith<NovaInterests> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NovaInterestsCopyWith<$Res> {
  factory $NovaInterestsCopyWith(
          NovaInterests value, $Res Function(NovaInterests) then) =
      _$NovaInterestsCopyWithImpl<$Res, NovaInterests>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? iconUrl,
      @JsonKey(ignore: true) String? docName});
}

/// @nodoc
class _$NovaInterestsCopyWithImpl<$Res, $Val extends NovaInterests>
    implements $NovaInterestsCopyWith<$Res> {
  _$NovaInterestsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iconUrl = freezed,
    Object? docName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      docName: freezed == docName
          ? _value.docName
          : docName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NovaInterestsCopyWith<$Res>
    implements $NovaInterestsCopyWith<$Res> {
  factory _$$_NovaInterestsCopyWith(
          _$_NovaInterests value, $Res Function(_$_NovaInterests) then) =
      __$$_NovaInterestsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? iconUrl,
      @JsonKey(ignore: true) String? docName});
}

/// @nodoc
class __$$_NovaInterestsCopyWithImpl<$Res>
    extends _$NovaInterestsCopyWithImpl<$Res, _$_NovaInterests>
    implements _$$_NovaInterestsCopyWith<$Res> {
  __$$_NovaInterestsCopyWithImpl(
      _$_NovaInterests _value, $Res Function(_$_NovaInterests) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iconUrl = freezed,
    Object? docName = freezed,
  }) {
    return _then(_$_NovaInterests(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      docName: freezed == docName
          ? _value.docName
          : docName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NovaInterests implements _NovaInterests {
  const _$_NovaInterests(
      {this.id,
      this.name,
      this.iconUrl,
      @JsonKey(ignore: true) this.docName = AppKeyNames.interests});

  factory _$_NovaInterests.fromJson(Map<String, dynamic> json) =>
      _$$_NovaInterestsFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? iconUrl;
  @override
  @JsonKey(ignore: true)
  final String? docName;

  @override
  String toString() {
    return 'NovaInterests(id: $id, name: $name, iconUrl: $iconUrl, docName: $docName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NovaInterests &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.docName, docName) || other.docName == docName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl, docName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NovaInterestsCopyWith<_$_NovaInterests> get copyWith =>
      __$$_NovaInterestsCopyWithImpl<_$_NovaInterests>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NovaInterestsToJson(
      this,
    );
  }
}

abstract class _NovaInterests
    implements NovaInterests, GlobalDocHelperInterface {
  const factory _NovaInterests(
      {final String? id,
      final String? name,
      final String? iconUrl,
      @JsonKey(ignore: true) final String? docName}) = _$_NovaInterests;

  factory _NovaInterests.fromJson(Map<String, dynamic> json) =
      _$_NovaInterests.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  String? get docName;
  @override
  @JsonKey(ignore: true)
  _$$_NovaInterestsCopyWith<_$_NovaInterests> get copyWith =>
      throw _privateConstructorUsedError;
}
