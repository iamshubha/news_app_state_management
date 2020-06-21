import 'package:flutter/material.dart';
import 'package:flutterapp/logic/news_response.dart';

import 'news_item.dart';
import 'news_loader.dart';

class NewsSection extends StatelessWidget {
  final Stream stream;

  const NewsSection({Key key, @required this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300.0,
      child: StreamBuilder<NewsResponse>(
        stream: stream,
        builder: (context, AsyncSnapshot<NewsResponse> snapShot) =>
            snapShot.hasData == true
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapShot.data.newsList == null
                        ? 0
                        : snapShot.data.newsList.length,
                    itemBuilder: (_, int index) => NewsItem(
                      newsTitle: snapShot.data.newsList[index].title,
                      newsPoster: snapShot.data.newsList[index].urlToImage,
                    ),
                  )
                : NewsLoader(),
      ),
    );
  }
}
