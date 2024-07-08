// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonRespDto _$PersonRespDtoFromJson(Map<String, dynamic> json) =>
    PersonRespDto(
      (json['page'] as num?)?.toInt() ?? 1,
      (json['per_page'] as num?)?.toInt() ?? 1,
      (json['total'] as num?)?.toInt() ?? 1,
      (json['total_pages'] as num?)?.toInt() ?? 1,
      (json['data'] as List<dynamic>)
          .map((e) => PersonRespData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonRespDtoToJson(PersonRespDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };

PersonRespData _$PersonRespDataFromJson(Map<String, dynamic> json) =>
    PersonRespData(
      (json['id'] as num?)?.toInt() ?? -1,
      json['email'] as String? ?? '',
      json['first_name'] as String? ?? '',
      json['last_name'] as String? ?? '',
      json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$PersonRespDataToJson(PersonRespData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstname,
      'last_name': instance.lastname,
      'avatar': instance.profile,
    };

PersonDetail _$PersonDetailFromJson(Map<String, dynamic> json) => PersonDetail(
      PersonRespData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonDetailToJson(PersonDetail instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
