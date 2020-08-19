import 'package:bqg/model/book_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_mall.g.dart';

/// 书城
@JsonSerializable()
class BookMall {
  @JsonKey(name: 'Category')
  String category;
  @JsonKey(name: 'ViewType')
  String viewType;
  @JsonKey(name: 'NavIcon')
  String navIcon;
  @JsonKey(name: 'More')
  String more;
  @JsonKey(name: 'MoreFlag')
  String moreFlag;
  @JsonKey(name: 'ChangeFlag')
  String changeFlag;
  @JsonKey(name: 'Books')
  List<BookItemModel> lists;

  BookMall(this.category, this.viewType, this.navIcon, this.more, this.moreFlag, this.changeFlag, this.lists);
  factory BookMall.fromJson(Map<String, dynamic> json) => _$BookMallFromJson(json);
  Map<String, dynamic> toJson() => _$BookMallToJson(this);
}