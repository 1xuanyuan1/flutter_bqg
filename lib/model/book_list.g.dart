// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookList _$BookListFromJson(Map<String, dynamic> json) {
  return BookList(
    (json['BookList'] as List)
        ?.map((e) => e == null
            ? null
            : BookItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['Page'] as int,
    json['HasNext'] as bool,
  );
}

Map<String, dynamic> _$BookListToJson(BookList instance) => <String, dynamic>{
      'BookList': instance.lists,
      'Page': instance.page,
      'HasNext': instance.hasNext,
    };
