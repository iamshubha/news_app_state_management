class NewsModel {
  final String description;
  final String urlToImage;
  final String title;

  NewsModel(
    this.description,
    this.urlToImage,
    this.title,
  );

  NewsModel.fromJSON(Map<String, dynamic> newsJSON)
      : description = newsJSON["description"],
        urlToImage = newsJSON["urlToImage"],
        title = newsJSON["title"];
}
