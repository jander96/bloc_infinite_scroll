import 'package:freezed_annotation/freezed_annotation.dart';
part 'hero.freezed.dart';
part 'hero.g.dart';

@freezed
class ApiResponse with _$ApiResponse{
  const factory ApiResponse({
    required int code,
    required String status,
    required Data data,
  }) = _ApiResponse;
  factory ApiResponse.fromJson(Map<String,dynamic> json) => _$ApiResponseFromJson(json);
}

@freezed
class Data with _$Data{
  const factory Data({
    required int limit,
    required int offset,
    required List<Hero> results,
  }) = _Data;
  factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);
}

@freezed
class Hero with _$Hero{
  const factory Hero({
    int? id,
    String? name,
    String? description,
    Thumbnail? thumbnail
}) = _Hero;
  factory Hero.fromJson(Map<String,dynamic> json) => _$HeroFromJson(json);
}


@freezed
class Thumbnail with _$Thumbnail{
  const factory Thumbnail({
    String? path,
    String? extension
  }) = _Thumbnail;

  factory Thumbnail.fromJson(Map<String,dynamic>json)=> _$ThumbnailFromJson(json);
}
