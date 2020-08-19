/*
{
                "Id": 8004,
                "Name": "魔门败类",
                "Author": "惊涛骇浪",
                "Img": "momenbailei.jpg",
                "Desc": "欺师灭祖，残害同门视为道门败类！不修佛法，屡犯五戒视为佛门败类！身为魔门血炼宗弟子林皓明，得到了一串神奇的功德珠，做“善事”、赚功德、解封印、得好处，于是魔门败类诞生了！这是老惊回归仙侠的作品，希望大家多多支持！本书老惊先打包票，肯定会完完整整的写好，所以大家尽管放心收藏！",
                "CName": "武侠仙侠",
                "Score": 6.8
}
 */
import 'package:json_annotation/json_annotation.dart';

part 'book_item_model.g.dart';

/**
 * 书籍
 */
@JsonSerializable()
class BookItemModel {
  @JsonKey(name: 'Id')
  int id;
  @JsonKey(name: 'Name')
  String name;
  @JsonKey(name: 'Author')
  String author;
  @JsonKey(name: 'Img')
  String img;
  @JsonKey(name: 'Desc')
  String desc;
  @JsonKey(name: 'CName')
  String cName;
  @JsonKey(name: 'Score')
  double score;

  BookItemModel(this.id,this.name,this.author,this.img,this.desc,this.cName,this.score);

  factory BookItemModel.fromJson(Map<String, dynamic> json) => _$BookItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookItemModelToJson(this);
}