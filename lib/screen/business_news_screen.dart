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
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<NewsResponse>(
        stream: newsBloc.subject.stream,
        builder: (context, AsyncSnapshot<NewsResponse> snapShot) =>
            snapShot.hasData == true
                ? businessNewsWidget(snapShot.data)
                : CircularProgressIndicator(),
      ),
    );
  }

  Widget businessNewsWidget(NewsResponse newsResponse) {
    List<NewsModel> news = newsResponse.newsList;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blueGrey[900],
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (_, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.network(news[index].urlToImage),
              Divider(),
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(20.0),
                child: Card(
                  color: Colors.blueGrey[800],
                  child: Text(
                    news[index].title,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
              Divider(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
