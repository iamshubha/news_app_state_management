import 'package:flutterapp/logic/news_response.dart';
import 'package:flutterapp/logic/respository/news_repository.dart';
import 'package:rxdart/subjects.dart';

class NewsBloc{

  final businessNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3fc464c420834d6fb76899f176e1ae6d';

  final sportsNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=3fc464c420834d6fb76899f176e1ae6d';

  final NewsRepository _newsRepository = NewsRepository();

  final BehaviorSubject<NewsResponse> _businessNewsSubject = BehaviorSubject<NewsResponse>();
  final BehaviorSubject<NewsResponse> _sportsNewsSubject = BehaviorSubject<NewsResponse>();

  getBusinessNews() async {
    NewsResponse newsResponse = await _newsRepository.getNews(businessNewsUrl);
    _businessNewsSubject.sink.add(newsResponse);
  }

  getSportsNews() async{
    NewsResponse newsResponse =  await _newsRepository.getNews(sportsNewsUrl);
    _sportsNewsSubject.sink.add(newsResponse);
  }

  dispose() {
    _businessNewsSubject.close();
  }

  BehaviorSubject<NewsResponse> get businessSubject => _businessNewsSubject;
  BehaviorSubject<NewsResponse> get sportsSubject => _sportsNewsSubject;
}

final newsBloc = NewsBloc();