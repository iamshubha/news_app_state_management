import 'package:flutterapp/logic/news_response.dart';
import 'package:flutterapp/logic/respository/news_repository.dart';
import 'package:rxdart/subjects.dart';

class NewsBloc{

  final NewsRepository _newsRepository = NewsRepository();
  final BehaviorSubject<NewsResponse> _newsSubject = BehaviorSubject<
      NewsResponse>();

  getNews() async {
    NewsResponse newsResponse = await _newsRepository.getBusinessNews();
    _newsSubject.sink.add(newsResponse);
  }

  dispose() {
    _newsSubject.close();
  }

  BehaviorSubject<NewsResponse> get subject => _newsSubject;
}

final newsBloc = NewsBloc();