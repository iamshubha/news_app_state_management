import 'dart:convert';
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

class NewsModel {
  final String author, urlToImage, title;

  const NewsModel(this.author, this.urlToImage, this.title);

  NewsModel.fromJson(Map<String, dynamic> json)
      : this.author = json['author'],
        this.urlToImage = json['urlToImage'],
        this.title = json['title'];

  Map<String, dynamic> toJson() => {
        "author": this.author,
        "url_to_image": this.urlToImage,
        "title": this.title,
      };
}

class NewsList {
  final List<NewsModel> newsList;

  NewsList(this.newsList);

  NewsList.fromJson(List<dynamic> usersJson)
      : newsList = usersJson.map(
          (news) => NewsModel.fromJson(news)).toList();
}
