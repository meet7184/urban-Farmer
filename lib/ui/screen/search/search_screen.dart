import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "searchScreen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 200),
          Center(
              child: Text(
            "Search",
            style: TextStyle(fontSize: 40),
          )),
        ],
      )),
    );
  }
}
