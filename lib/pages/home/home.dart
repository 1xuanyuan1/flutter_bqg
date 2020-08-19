import 'package:bqg/http/http_repository.dart';
import 'package:bqg/model/book_item_model.dart';
import 'package:bqg/model/book_mall.dart';

import 'package:bqg/utils/log_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<BookMall> _lists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true, 								//解决无限高度问题
//        physics: new NeverScrollableScrollPhysics(),
        itemCount: this._lists.length,
        itemBuilder: (BuildContext context, int index) {
          BookMall item = this._lists[index];
//          for (BookItemModel book in item.lists) {
//            LogUtil.e(book.name);
//          }
//          BookItemModel book = item.lists[0];
          return Column(
            children: [
              Row(
                children: [
                  Image.network(item.navIcon),
                  Text(item.category),
//
                ],
              ),
              GridView.builder(
                shrinkWrap: true, 								//解决无限高度问题
                physics: new NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: item.lists.length,
                itemBuilder: (BuildContext context1, int index2) {
                  BookItemModel book = item.lists[index2];
                  return Container(
                    child: Column(
                        children: [
                          Image(
                            image: NetworkImage(HttpRepository.getImageUrl(name: book.img)),
                            height: 120,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                          Text(
                              book.name,
                              style: TextStyle(
                                fontSize: 10
                              ),
                              overflow: TextOverflow.ellipsis,
                          ),
                        ],
                    ),
                  );
                },
              ),
//              ListView.builder(
//                  shrinkWrap: true, 								//解决无限高度问题
//                  physics: new NeverScrollableScrollPhysics(),
//                  itemCount: item.lists.length,
//                  itemBuilder: (BuildContext context1, int index2) {
//                    BookItemModel book = item.lists[index2];
//                    return Column(
//                        children: [
//                          Text(book.name),
//                          Image(
//                            image: NetworkImage(HttpRepository.getImageUrl(name: book.img)),
//                            height: 120,
//                            width: 80,
//                            fit: BoxFit.fill,
//                          )
//                        ]
//                    );
//                  },
//              ),
//              Row(
//                children: [
//                  Column(
//                    children: [
//                      Text(book.name),
//                      Image(
//                        image: NetworkImage(HttpRepository.getImageUrl(name: book.img)),
//                        height: 120,
//                        width: 80,
//                        fit: BoxFit.fill,
//                      )
//                    ],
//                  ),
//                ],
//              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    LogUtil.init(isDebug: true);
    getData();
  }

  void getData () async {
//    BookList bookList = await HttpRepository().getBookList(
//        type: HttpConstants.RANK_TYPE_NEW,
//        time: HttpConstants.RANK_TIME_WEEK
//    );

    List<BookMall> lists = await HttpRepository().getBookMall();
    setState(() {
      this._lists = lists;
    });

  }
}