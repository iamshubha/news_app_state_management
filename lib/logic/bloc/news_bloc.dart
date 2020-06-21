import 'package:flutterapp/assets/url.dart';
import 'package:flutterapp/logic/news_response.dart';
import 'package:flutterapp/logic/respository/news_repository.dart';
import 'package:rxdart/subjects.dart';

class NewsBloc{

  final NewsRepository _newsRepository = NewsRepository();

  final BehaviorSubject<NewsResponse> _businessNewsSubject = BehaviorSubject<NewsResponse>();
  final BehaviorSubject<NewsResponse> _sportsNewsSubject = BehaviorSubject<NewsResponse>();
  final BehaviorSubject<NewsResponse> _scienceNewsSubject = BehaviorSubject<NewsResponse>();
  final BehaviorSubject<NewsResponse> _healthNewsSubject = BehaviorSubject<NewsResponse>();
  final BehaviorSubject<NewsResponse> _technologyNewsSubject = BehaviorSubject<NewsResponse>();
  final BehaviorSubject<NewsResponse> _entertainmentNewsSubject = BehaviorSubject<NewsResponse>();

  getNews(String newsUrl) async {
    NewsResponse newsResponse = await _newsRepository.getNews(newsUrl);

    if(newsUrl == businessNewsUrl) {
      _businessNewsSubject.sink.add(newsResponse);
    }else if(newsUrl == sportsNewsUrl){
      _sportsNewsSubject.sink.add(newsResponse);
    }else if(newsUrl == scienceNewsUrl){
      _scienceNewsSubject.sink.add(newsResponse);
    }else if(newsUrl == healthNewsUrl){
      _healthNewsSubject.sink.add(newsResponse);
    }else if(newsUrl == technologyNewsUrl){
      _technologyNewsSubject.sink.add(newsResponse);
    }else if(newsUrl == entertainmentNewsUrl){
      _entertainmentNewsSubject.sink.add(newsResponse);
    }
  }

  dispose() {
    _businessNewsSubject.close();
    _sportsNewsSubject.close();
    _scienceNewsSubject.close();
    _healthNewsSubject.close();
    _technologyNewsSubject.close();
    _entertainmentNewsSubject.close();
  }

  BehaviorSubject<NewsResponse> get businessSubject => _businessNewsSubject;
  BehaviorSubject<NewsResponse> get sportsSubject => _sportsNewsSubject;
  BehaviorSubject<NewsResponse> get scienceSubject => _scienceNewsSubject;
  BehaviorSubject<NewsResponse> get healthSubject => _healthNewsSubject;
  BehaviorSubject<NewsResponse> get technologySubject => _technologyNewsSubject;
  BehaviorSubject<NewsResponse> get entertainmentSubject => _entertainmentNewsSubject;
}

final newsBloc = NewsBloc();