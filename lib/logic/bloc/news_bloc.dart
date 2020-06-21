import 'dart:convert';
import 'package:flutterapp/logic/model/news_model.dart';
import 'package:flutterapp/logic/repository/news_list.dart';
import 'package:http/http.dart' as http;

class NewsBloc {
  final String businessUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3fc464c420834d6fb76899f176e1ae6d";


  final String sportsUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=3fc464c420834d6fb76899f176e1ae6d";

  List<NewsModel> businessNews;

  Future<List<NewsModel>> loadBusinessNews() async {
    var dataString = await loadURL(businessUrl);
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    businessNews = NewsList.fromJson(jsonUserData['articles']).newsList;
    return businessNews;
  }

  List<NewsModel> sportsNews;

  Future<List<NewsModel>> loadSportsNews() async {
    var dataString = await loadURL(sportsUrl);
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    businessNews = NewsList.fromJson(jsonUserData['articles']).newsList;
    return businessNews;
  }

  Future<String> loadURL(String url) async {
    var response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
    return response.body;
  }
}
