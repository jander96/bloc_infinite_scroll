// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      code: json['code'] as int,
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      limit: json['limit'] as int,
      offset: json['offset'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Hero.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'results': instance.results,
    };

_$HeroImpl _$$HeroImplFromJson(Map<String, dynamic> json) => _$HeroImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HeroImplToJson(_$HeroImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };

_$ThumbnailImpl _$$ThumbnailImplFromJson(Map<String, dynamic> json) =>
    _$ThumbnailImpl(
      path: json['path'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$$ThumbnailImplToJson(_$ThumbnailImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };
