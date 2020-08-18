import 'package:bqg/model/bookItemModel.dart';
import 'package:json_annotation/json_annotation.dart';
part 'bookList.g.dart';

/**
 * 书籍
 */
@JsonSerializable()
class BookList {
  @JsonKey(name: 'BookList')
  List<BookItemModel> lists;
  @JsonKey(name: 'Page')
  int page;
  @JsonKey(name: 'HasNext')
  bool hasNext;

  BookList(this.lists, this.page, this.hasNext);

  factory BookList.fromJson(Map<String, dynamic> json) => _$BookListFromJson(json);
  Map<String, dynamic> toJson() => _$BookListToJson(this);
}