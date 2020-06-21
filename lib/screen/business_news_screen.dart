import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/logic/bloc/news_bloc.dart';
import 'package:flutterapp/logic/model/news_model.dart';
import 'package:flutterapp/logic/news_response.dart';

class BusinessNewsScreen extends StatefulWidget {
  @override
  _BusinessNewsScreenState createState() => _BusinessNewsScreenState();
}

class _BusinessNewsScreenState extends State<BusinessNewsScreen> {
  @override
  void initState() {
    super.initState();
    newsBloc..getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
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
                child: StreamBuilder<NewsResponse>(
                  stream: newsBloc.subject.stream,
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
                          : ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (_, int index) => NewsItem(
                                newsTitle: 'Loading',
                                newsPoster:
                                    'https://miro.medium.com/max/882/1*9EBHIOzhE1XfMYoKz1JcsQ.gif',
                              ),
                            ),
                ),
              ),
            ],
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
