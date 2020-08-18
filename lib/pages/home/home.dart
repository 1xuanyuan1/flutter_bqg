import 'package:bqg/http/http_constants.dart';
import 'package:bqg/http/http_repository.dart';
import 'package:bqg/model/bookItemModel.dart';
import 'package:bqg/model/bookList.dart';
import 'package:dio/dio.dart';

import 'package:bqg/utils/log_util.dart';
import 'package:flutter/material.dart';

Dio dio =  Dio();
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<BookItemModel> _lists = [];
  @override
  Widget build(BuildContext context) {
    LogUtil.init(isDebug: true);
    getData();
    return Scaffold(
      body: ListView.builder(
        itemCount: this._lists.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(this._lists[index].name);
        },
      ),
    );
  }

  void getData () async {
    BookList bookList = await HttpRepository().getBookList(
        type: HttpConstants.RANK_TYPE_NEW,
        time: HttpConstants.RANK_TIME_WEEK
    );
    setState(() {
      this._lists = bookList.lists;
    });

  }
}