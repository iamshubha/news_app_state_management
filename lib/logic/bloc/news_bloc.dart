import 'dart:convert';
import 'package:flutterapp/logic/model/news_model.dart';
import 'package:flutterapp/logic/repository/news_list.dart';
import 'package:http/http.dart' as http;

class NewsBloc {
  final String newsUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3fc464c420834d6fb76899f176e1ae6d";

  List<NewsModel> users;

  Future<List<NewsModel>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = NewsList.fromJson(jsonUserData['articles']).newsList;
    print('done loading user!' + jsonEncode(users));
    return users;
  }

  Future<String> loadAsset() async {
    var response = await http.get(Uri.encodeFull(newsUrl),
        headers: {"Accept": "application/json"});

    return response.body;
  }
}
