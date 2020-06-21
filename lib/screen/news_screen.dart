import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/logic/model/news_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var news = Provider.of<List<NewsModel>>(context);
    var news1 = Provider.of<List<NewsModel1>>(context);
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[900],
                Colors.blue[800],
                Colors.red[900],
                Colors.red[500],
                Colors.redAccent[400],
                Colors.redAccent[200],
                Colors.white30,
                Colors.white70,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              tileMode: TileMode.mirror
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: 'Business'),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: news == null
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (_, int index) => NewsItem(
                            newsTitle: 'Loading',
                            newsPoster:
                                'https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif',
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: news.length == null ? 0 : news.length,
                          itemBuilder: (_, int index) => NewsItem(
                            newsTitle: news[index].title,
                            newsPoster: news[index].urlToImage,
                          ),
                        ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TitleWidget(title: 'Sports'),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: news1 == null
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (_, int index) => NewsItem(
                            newsTitle: 'Loading',
                            newsPoster:
                                'https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif',
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: news1.length == null ? 0 : news1.length,
                          itemBuilder: (_, int index) => NewsItem(
                            newsTitle: news1[index].title,
                            newsPoster: news1[index].urlToImage,
                          ),
                        ),
                ),
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

class NewsItem extends StatelessWidget {
  final String newsTitle;
  final String newsPoster;

  const NewsItem({
    Key key,
    @required this.newsTitle,
    @required this.newsPoster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 20.0,
        child: Container(
          width: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              newsPoster == null
                  ? Image.network(
                      'https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif',
                      scale: 2.5,
                    )
                  : Image.network(
                      newsPoster,
                    ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    newsTitle,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
