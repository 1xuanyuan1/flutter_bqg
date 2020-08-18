/*
"status": 1,
"info": "success",
"data": {}
 */
import 'package:json_annotation/json_annotation.dart';
part 'baseResponse.g.dart';

/**
 * 默认接口返回样式
 */
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int status;
  @JsonKey(name: 'info')
  String info;
  @JsonKey(name: 'data')
  var data;

  BaseResponse(this.status, this.info, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}