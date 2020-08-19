import 'package:bqg/http/http_request.dart';
import 'package:bqg/model/book_list.dart';
import 'package:bqg/model/book_mall.dart';
import 'package:flutter/material.dart';

class HttpRepository {
  static HttpRepository _sInstance;
  static HttpRepository getInstance () {
    if (_sInstance != null)  {
      _sInstance = new HttpRepository();
    }
    return _sInstance;
  }

  Future<BookList> getBookList ({String type, String time, int page = 1}) async {
    String url = 'https://scxs.geziqiuzhi.com/top/man/top/$type/$time/$page.html';
    BookList bookList = BookList.fromJson(await HttpRequest.getInstance().get(url));
    return bookList;
  }

  Future<List<BookMall>> getBookMall () async {
    String url = 'https://scxs.geziqiuzhi.com/prov8/base/lady2.html';
//    List list = await HttpRequest.getInstance().get(url);
    List<BookMall> list = ((await HttpRequest.getInstance().get(url)) as List)?.map((e) => e == null
        ? null
        : BookMall.fromJson(e as Map<String, dynamic>))
        ?.toList();
    return list;
  }

  static String getImageUrl ({@required String name}) {
    return 'https://imgapi.jiaston.com/BookFiles/BookImages/$name';
  }
}