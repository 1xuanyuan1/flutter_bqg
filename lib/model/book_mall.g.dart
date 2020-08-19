// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_mall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookMall _$BookMallFromJson(Map<String, dynamic> json) {
  return BookMall(
    json['Category'] as String,
    json['ViewType'] as String,
    json['NavIcon'] as String,
    json['More'] as String,
    json['MoreFlag'] as String,
    json['ChangeFlag'] as String,
    (json['Books'] as List)
        ?.map((e) => e == null
            ? null
            : BookItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BookMallToJson(BookMall instance) => <String, dynamic>{
      'Category': instance.category,
      'ViewType': instance.viewType,
      'NavIcon': instance.navIcon,
      'More': instance.more,
      'MoreFlag': instance.moreFlag,
      'ChangeFlag': instance.changeFlag,
      'Books': instance.lists,
    };
