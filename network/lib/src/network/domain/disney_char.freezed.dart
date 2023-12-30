// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disney_char.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DisneyResponse _$DisneyResponseFromJson(Map<String, dynamic> json) {
  return _DisneyResponse.fromJson(json);
}

/// @nodoc
mixin _$DisneyResponse {
  @JsonKey(name: 'data')
  List<DisneyData> get chars => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisneyResponseCopyWith<DisneyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisneyResponseCopyWith<$Res> {
  factory $DisneyResponseCopyWith(
          DisneyResponse value, $Res Function(DisneyResponse) then) =
      _$DisneyResponseCopyWithImpl<$Res, DisneyResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') List<DisneyData> chars});
}

/// @nodoc
class _$DisneyResponseCopyWithImpl<$Res, $Val extends DisneyResponse>
    implements $DisneyResponseCopyWith<$Res> {
  _$DisneyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chars = null,
  }) {
    return _then(_value.copyWith(
      chars: null == chars
          ? _value.chars
          : chars // ignore: cast_nullable_to_non_nullable
              as List<DisneyData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisneyResponseImplCopyWith<$Res>
    implements $DisneyResponseCopyWith<$Res> {
  factory _$$DisneyResponseImplCopyWith(_$DisneyResponseImpl value,
          $Res Function(_$DisneyResponseImpl) then) =
      __$$DisneyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') List<DisneyData> chars});
}

/// @nodoc
class __$$DisneyResponseImplCopyWithImpl<$Res>
    extends _$DisneyResponseCopyWithImpl<$Res, _$DisneyResponseImpl>
    implements _$$DisneyResponseImplCopyWith<$Res> {
  __$$DisneyResponseImplCopyWithImpl(
      _$DisneyResponseImpl _value, $Res Function(_$DisneyResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chars = null,
  }) {
    return _then(_$DisneyResponseImpl(
      chars: null == chars
          ? _value._chars
          : chars // ignore: cast_nullable_to_non_nullable
              as List<DisneyData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisneyResponseImpl implements _DisneyResponse {
  const _$DisneyResponseImpl(
      {@JsonKey(name: 'data') required final List<DisneyData> chars})
      : _chars = chars;

  factory _$DisneyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisneyResponseImplFromJson(json);

  final List<DisneyData> _chars;
  @override
  @JsonKey(name: 'data')
  List<DisneyData> get chars {
    if (_chars is EqualUnmodifiableListView) return _chars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chars);
  }

  @override
  String toString() {
    return 'DisneyResponse(chars: $chars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisneyResponseImpl &&
            const DeepCollectionEquality().equals(other._chars, _chars));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisneyResponseImplCopyWith<_$DisneyResponseImpl> get copyWith =>
      __$$DisneyResponseImplCopyWithImpl<_$DisneyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisneyResponseImplToJson(
      this,
    );
  }
}

abstract class _DisneyResponse implements DisneyResponse {
  const factory _DisneyResponse(
          {@JsonKey(name: 'data') required final List<DisneyData> chars}) =
      _$DisneyResponseImpl;

  factory _DisneyResponse.fromJson(Map<String, dynamic> json) =
      _$DisneyResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<DisneyData> get chars;
  @override
  @JsonKey(ignore: true)
  _$$DisneyResponseImplCopyWith<_$DisneyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DisneyData _$DisneyDataFromJson(Map<String, dynamic> json) {
  return _DisneyData.fromJson(json);
}

/// @nodoc
mixin _$DisneyData {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisneyDataCopyWith<DisneyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisneyDataCopyWith<$Res> {
  factory $DisneyDataCopyWith(
          DisneyData value, $Res Function(DisneyData) then) =
      _$DisneyDataCopyWithImpl<$Res, DisneyData>;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: '_id') int? id,
      @JsonKey(name: 'imageUrl') String? imageUrl});
}

/// @nodoc
class _$DisneyDataCopyWithImpl<$Res, $Val extends DisneyData>
    implements $DisneyDataCopyWith<$Res> {
  _$DisneyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisneyDataImplCopyWith<$Res>
    implements $DisneyDataCopyWith<$Res> {
  factory _$$DisneyDataImplCopyWith(
          _$DisneyDataImpl value, $Res Function(_$DisneyDataImpl) then) =
      __$$DisneyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: '_id') int? id,
      @JsonKey(name: 'imageUrl') String? imageUrl});
}

/// @nodoc
class __$$DisneyDataImplCopyWithImpl<$Res>
    extends _$DisneyDataCopyWithImpl<$Res, _$DisneyDataImpl>
    implements _$$DisneyDataImplCopyWith<$Res> {
  __$$DisneyDataImplCopyWithImpl(
      _$DisneyDataImpl _value, $Res Function(_$DisneyDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$DisneyDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisneyDataImpl implements _DisneyData {
  const _$DisneyDataImpl(
      {this.name = '',
      @JsonKey(name: '_id') this.id = 0,
      @JsonKey(name: 'imageUrl') this.imageUrl = ''});

  factory _$DisneyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisneyDataImplFromJson(json);

  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey(name: '_id')
  final int? id;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @override
  String toString() {
    return 'DisneyData(name: $name, id: $id, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisneyDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisneyDataImplCopyWith<_$DisneyDataImpl> get copyWith =>
      __$$DisneyDataImplCopyWithImpl<_$DisneyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisneyDataImplToJson(
      this,
    );
  }
}

abstract class _DisneyData implements DisneyData {
  const factory _DisneyData(
      {final String? name,
      @JsonKey(name: '_id') final int? id,
      @JsonKey(name: 'imageUrl') final String? imageUrl}) = _$DisneyDataImpl;

  factory _DisneyData.fromJson(Map<String, dynamic> json) =
      _$DisneyDataImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: '_id')
  int? get id;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$DisneyDataImplCopyWith<_$DisneyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
