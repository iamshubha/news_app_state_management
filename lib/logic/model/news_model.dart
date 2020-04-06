class NewsModel {
  final String author;
  final String urlToImage;
  final String title;

  NewsModel(
    this.author,
    this.urlToImage,
    this.title,
  );

  NewsModel.fromJSON(Map<String, dynamic> newsJSON)
      : author = newsJSON['author'],
        urlToImage = newsJSON['urlToImage'],
        title = newsJSON['title'];
}
