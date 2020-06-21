import 'package:flutter/material.dart';
import 'package:flutterapp/logic/model/news_model.dart';
import 'package:provider/provider.dart';

class BusinessNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var news = Provider.of<List<NewsModel>>(context);
    return Scaffold(
      appBar: AppBar(),
      body: news == null ? Container(child: Text('Loading.....')) :ListView.builder(
        itemCount: news.length == null ? 0 : news.length,
        itemBuilder: (_, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            news[index].urlToImage,
          ),
        ),
      ),
    );
  }
}
