// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookItemModel _$BookItemModelFromJson(Map<String, dynamic> json) {
  return BookItemModel(
    json['Id'] as int,
    json['Name'] as String,
    json['Author'] as String,
    json['Img'] as String,
    json['Desc'] as String,
    json['CName'] as String,
    (json['Score'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BookItemModelToJson(BookItemModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Author': instance.author,
      'Img': instance.img,
      'Desc': instance.desc,
      'CName': instance.cName,
      'Score': instance.score,
    };
