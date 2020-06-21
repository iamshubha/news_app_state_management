
class NewsModel {
  final String author, urlToImage, title;

  const NewsModel(this.author, this.urlToImage, this.title);

  NewsModel.fromJson(Map<String, dynamic> json)
      : this.author = json['author'],
        this.urlToImage = json['urlToImage'],
        this.title = json['title'];
}

class NewsModel1 {
  final String author, urlToImage, title;

  const NewsModel1(this.author, this.urlToImage, this.title);

  NewsModel1.fromJson(Map<String, dynamic> json)
      : this.author = json['author'],
        this.urlToImage = json['urlToImage'],
        this.title = json['title'];
}
