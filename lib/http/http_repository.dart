import 'package:bqg/http/http_request.dart';
import 'package:bqg/model/bookList.dart';

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
}