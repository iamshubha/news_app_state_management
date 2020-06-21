import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/assets/url.dart';
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
    newsBloc..getNews(businessNewsUrl);
    newsBloc..getNews(sportsNewsUrl);
    newsBloc..getNews(scienceNewsUrl);
    newsBloc..getNews(healthNewsUrl);
    newsBloc..getNews(technologyNewsUrl);
    newsBloc..getNews(entertainmentNewsUrl);
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
                NewsSection(stream: newsBloc.businessSubject.stream),
                SizedBox(
                  height: 30.0,
                ),
                TitleWidget(title: 'Sports'),
                SizedBox(
                  height: 20.0,
                ),
                NewsSection(stream: newsBloc.sportsSubject.stream),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                TitleWidget(title: 'Science'),
                SizedBox(
                  height: 20.0,
                ),
                NewsSection(stream: newsBloc.scienceSubject.stream),
                SizedBox(
                  height: 30.0,
                ),
                TitleWidget(title: 'Health'),
                SizedBox(
                  height: 20.0,
                ),
                NewsSection(stream: newsBloc.healthSubject.stream),
                SizedBox(
                  height: 30.0,
                ),
                TitleWidget(title: 'Technology'),
                SizedBox(
                  height: 20.0,
                ),
                NewsSection(stream: newsBloc.technologySubject.stream),
                SizedBox(
                  height: 30.0,
                ),
                TitleWidget(title: 'Entertainment'),
                SizedBox(
                  height: 20.0,
                ),
                NewsSection(stream: newsBloc.entertainmentSubject.stream),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
