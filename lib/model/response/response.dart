import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class PersonRespDto {
  @JsonKey(name: 'page', defaultValue: 1)
  int page;
  @JsonKey(name: 'per_page', defaultValue: 1)
  int perPage;
  @JsonKey(name: 'total', defaultValue: 1)
  int total;
  @JsonKey(name: 'total_pages', defaultValue: 1)
  int totalPages;
  @JsonKey(name: 'data')
  List<PersonRespData> data;

  PersonRespDto(this.page, this.perPage, this.total, this.totalPages, this.data);

  factory PersonRespDto.fromJson(Map<String, dynamic> json) => _$PersonRespDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonRespDtoToJson(this);
}

@JsonSerializable()
class PersonRespData {
  @JsonKey(name: 'id', defaultValue: -1)
  int id;
  @JsonKey(name: 'email', defaultValue: '')
  String email;
  @JsonKey(name: 'first_name', defaultValue: '')
  String firstname;
  @JsonKey(name: 'last_name', defaultValue: '')
  String lastname;
  @JsonKey(name: 'avatar', defaultValue: '')
  String profile;

  PersonRespData(this.id, this.email, this.firstname, this.lastname, this.profile);

  factory PersonRespData.fromJson(Map<String, dynamic> json) => _$PersonRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$PersonRespDataToJson(this);
}

@JsonSerializable()
class PersonDetail {
  @JsonKey(name: 'data')
  PersonRespData data;

  PersonDetail(this.data);

  factory PersonDetail.fromJson(Map<String, dynamic> json) => _$PersonDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDetailToJson(this);
}
