import 'package:flutter/material.dart';
import 'package:flutterapp/logic/model/news_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var news = Provider.of<List<NewsModel>>(context);
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TitleWidget(title: 'General'),
                TitleWidget(title: 'Business'),
                TitleWidget(title: 'Sports'),
                TitleWidget(title: 'Health'),
                TitleWidget(title: 'Science'),
                TitleWidget(title: 'Fashion'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 50.0,
          ),
        ),
      ),
    );
  }
}
