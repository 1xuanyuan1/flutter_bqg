import 'package:bqg/http/http_request.dart';
import 'package:bqg/model/book_list.dart';
import 'package:bqg/model/book_mall.dart';
import 'package:bqg/utils/log_util.dart';
import 'package:flutter/material.dart';

class HttpRepository {
  static HttpRepository _sInstance;
  static HttpRepository getInstance () {
    if (_sInstance != null)  {
      _sInstance = new HttpRepository();
    }
    return _sInstance;
  }

  /// 获取书籍列表
  /// type: 榜单类型; time: 榜单时长; page 页数
  Future<BookList> getBookList ({@required String type,@required String time, int page = 1}) async {
    String url = 'https://scxs.geziqiuzhi.com/top/man/top/$type/$time/$page.html';
    BookList bookList = BookList.fromJson(await HttpRequest.getInstance().get(url));
    return bookList;
  }


//  Future<List<BookMall>> getBookMall ({@required String gender}) async {
//    String url = 'https://scxs.geziqiuzhi.com/prov8/base/${gender}2.html';
//    Map map = await HttpRequest.getInstance().get(url);
//
//    LogUtil.e(map);
//    return null;
////    list?.map((e) => e == null
////        ? null
////        : BookItemModel.fromJson(e as Map<String, dynamic>))
////        ?.toList(),
//  }
}