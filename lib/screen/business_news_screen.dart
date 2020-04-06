import 'package:flutter/material.dart';
import 'package:flutterapp/logic/bloc/news_bloc.dart';
import 'package:provider/provider.dart';

class BusinessNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var news = Provider.of<List<NewsModel>>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (_,int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(news[index].urlToImage),
        ),
      ),
    );
  }
}
