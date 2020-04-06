import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutterapp/logic/news_response.dart';

class NewsRepository {
  final businessNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3fc464c420834d6fb76899f176e1ae6d';

  Future<NewsResponse> getBusinessNews() async {
    var response = await http.get(Uri.encodeFull(businessNewsUrl),
        headers: {"Accept": "application/json"});
    print(json.decode(response.body));
    return NewsResponse.fromJSON(json.decode(response.body));
  }
}
