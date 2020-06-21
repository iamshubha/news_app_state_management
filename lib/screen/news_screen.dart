import 'package:flutter/material.dart';
import 'package:flutterapp/assets/url.dart';
import 'package:flutterapp/logic/bloc/news_bloc.dart';
import 'package:flutterapp/tools/news_section.dart';
import 'package:flutterapp/tools/title_widget.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
                tileMode: TileMode.mirror),
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