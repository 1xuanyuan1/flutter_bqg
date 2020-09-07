import 'package:bqg/http/http_request.dart';
import 'package:bqg/model/book_item_model.dart';
import 'package:bqg/model/book_list.dart';
import 'package:bqg/model/book_mall.dart';
import 'package:flutter/material.dart';

class HttpRepository {
  Future<BookList> getBookList ({@required String type,@required String time, int page = 1}) async {
    String url = 'https://scxs.geziqiuzhi.com/top/man/top/$type/$time/$page.html';
    BookList bookList = BookList.fromJson(await HttpRequest().get(url));
    return bookList;
  }

  Future<List<BookMall>> getBookMall () async {
    String url = 'https://scxs.geziqiuzhi.com/prov8/base/man2.html';
//    List list = await HttpRequest.getInstance().get(url);
    List<BookMall> list = ((await HttpRequest().get(url)) as List)?.map((e) => e == null
        ? null
        : BookMall.fromJson(e as Map<String, dynamic>))
        ?.toList();
    return list;
  }

  Future<BookItemModel> getBookInfo ({@required int novelId}) async {
    int id = novelId ~/ 1000 + 1;
    String url = 'https://infosxs.geziqiuzhi.com/BookFiles/Html/$id/$novelId/info.html';
    print('duke: ' + url);
    BookItemModel item = BookItemModel.fromJson(await HttpRequest().get(url));
    return item;
  }


  static String getImageUrl ({@required String name}) {
    return 'https://imgapi.jiaston.com/BookFiles/BookImages/$name';
  }
}