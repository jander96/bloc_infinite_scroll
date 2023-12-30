import 'package:freezed_annotation/freezed_annotation.dart';

part 'disney_char.freezed.dart';

part 'disney_char.g.dart';

@freezed
class DisneyResponse with _$DisneyResponse {
  const factory DisneyResponse({
    @JsonKey(name: 'data') required List<DisneyData> chars,
  }) = _DisneyResponse;

  factory DisneyResponse.fromJson(Map<String, dynamic> json) =>
      _$DisneyResponseFromJson(json);
}

@freezed
class DisneyData with _$DisneyData {
  const factory DisneyData({
    @Default('') String? name,
    @Default(0) @JsonKey(name: '_id') int? id,
    @Default('') @JsonKey(name: 'imageUrl') String? imageUrl,
  }) = _DisneyData;

  factory DisneyData.fromJson(Map<String, dynamic> json) =>
      _$DisneyDataFromJson(json);
}
