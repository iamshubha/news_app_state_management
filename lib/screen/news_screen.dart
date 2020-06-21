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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(title: 'Business'),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140.0,
                    child: news == null
                        ? Center(
                            child: Text('Loading'),
                          )
                        : Container(
                      height: 400.0,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: news.length == null ? 0 : news.length,
                              itemBuilder: (_, int index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 20.0,
                                  child: Container(
                                    width: 200.0,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 400.0,
                                          child: news[index].urlToImage == null
                                              ? Image.network(
                                                  'https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif',
                                                  fit: BoxFit.fill,

                                                )
                                              : Image.network(
                                                  news[index].urlToImage,
                                                  fit: BoxFit.contain,
                                                  scale: 2.0,
                                                ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(news[index].title),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                  ),
                ],
              ),
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
