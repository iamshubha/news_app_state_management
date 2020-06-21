import 'package:flutterapp/logic/model/news_model.dart';

class NewsList {
  final List<NewsModel> newsList;

  NewsList(this.newsList);

  NewsList.fromJson(List<dynamic> usersJson)
      : newsList = usersJson.map(
          (news) => NewsModel.fromJson(news)).toList();
}

class NewsList1 {
  final List<NewsModel1> newsList1;

  NewsList1(this.newsList1);

  NewsList1.fromJson(List<dynamic> usersJson)
      : newsList1 = usersJson.map(
          (news) => NewsModel1.fromJson(news)).toList();
}