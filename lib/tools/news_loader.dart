import 'package:flutter/material.dart';

import 'news_item.dart';

class NewsLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (_, int index) => NewsItem(
        newsTitle: 'Loading',
        newsPoster:
            'https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif',
      ),
    );
  }
}
