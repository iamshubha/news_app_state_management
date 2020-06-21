import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutterapp/logic/news_response.dart';

class NewsRepository {
  Future<NewsResponse> getNews(String url) async {
    var response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
    return NewsResponse.fromJSON(json.decode(response.body));
  }
}
