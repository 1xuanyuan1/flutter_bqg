import 'package:flutter/material.dart';

class BookCasePage extends StatefulWidget {
  @override
  _BookCasePageState createState() {
    return _BookCasePageState();
  }
}

class _BookCasePageState extends State<BookCasePage>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
          child: Text("书架")
      ),
    );
  }
}