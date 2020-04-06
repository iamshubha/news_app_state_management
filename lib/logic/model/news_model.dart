
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
