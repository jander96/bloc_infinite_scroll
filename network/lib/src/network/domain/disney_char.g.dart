// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disney_char.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisneyResponseImpl _$$DisneyResponseImplFromJson(Map<String, dynamic> json) =>
    _$DisneyResponseImpl(
      chars: (json['data'] as List<dynamic>)
          .map((e) => DisneyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DisneyResponseImplToJson(
        _$DisneyResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.chars,
    };

_$DisneyDataImpl _$$DisneyDataImplFromJson(Map<String, dynamic> json) =>
    _$DisneyDataImpl(
      name: json['name'] as String? ?? '',
      id: json['_id'] as int? ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$DisneyDataImplToJson(_$DisneyDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      '_id': instance.id,
      'imageUrl': instance.imageUrl,
    };
