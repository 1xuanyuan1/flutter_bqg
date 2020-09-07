import 'package:bqg/http/http_repository.dart';
import 'package:bqg/model/book_item_model.dart';
import 'package:bqg/utils/log_util.dart';
import 'package:flutter/material.dart';

class BookInfoPage extends StatefulWidget {
  final int novelId;
  BookInfoPage(this.novelId);
  @override
  _BookInfoPageState createState() {
    return _BookInfoPageState();
  }
}

class _BookInfoPageState extends State<BookInfoPage> with RouteAware {
  BookItemModel bookInfo;
  @override
  void initState() {
    super.initState();
    getData();
  }
  void getData () async {
    BookItemModel bookInfo = await HttpRepository().getBookInfo(novelId: this.widget.novelId);
    this.setState(() {
      this.bookInfo = bookInfo;
    });
    LogUtil.v(bookInfo);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Center(
              child: Text("书籍11详情" + this.widget.novelId.toString() + (bookInfo != null? bookInfo.name : ''))
          ),
        ],
      ),
    );
  }
}