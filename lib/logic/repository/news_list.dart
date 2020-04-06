import 'package:flutterapp/logic/model/news_model.dart';

class NewsList {
  final List<NewsModel> newsList;

  NewsList(this.newsList);

  NewsList.fromJson(List<dynamic> usersJson)
      : newsList = usersJson.map(
          (news) => NewsModel.fromJson(news)).toList();
}