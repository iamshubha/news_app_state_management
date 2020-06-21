import 'package:flutter/material.dart';
import 'package:flutterapp/assets/url.dart';

import 'news_item.dart';

class NewsLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (_, int index) => NewsItem(
        newsDescription: null,
        newsTitle: 'Loading......',
        newsPoster:
            loadingImage,
      ),
    );
  }
}
