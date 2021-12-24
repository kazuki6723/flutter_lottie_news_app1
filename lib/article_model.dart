
class Article{
  String? title;
  String? url;
  String? urlToImage;

  Article({this.title, this.url, this.urlToImage,});

  factory Article.fromJson(Map<String, dynamic?> json) {
    return Article(
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      urlToImage: json['urlToImage'] as String? ?? '',
    );
  }

}