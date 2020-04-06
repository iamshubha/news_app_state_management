import 'package:flutterapp/logic/model/news_model.dart';

class NewsResponse {
  final String error;
  final List<NewsModel> newsList;

  NewsResponse(this.error, this.newsList);

  NewsResponse.fromJSON(Map<String, dynamic> responseJSON)
      : newsList = (responseJSON['articles'] as List)
            .map((e) => NewsModel.fromJSON(e))
            .toList(),
        error = responseJSON[''];

  NewsResponse.withErrorValue(String errorValue)
      : newsList = List(),
        error = errorValue;
}
