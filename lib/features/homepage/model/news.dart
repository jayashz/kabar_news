class News {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  News({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "Unknown",
        title: json["title"] ?? "No title",
        description: json["description"] ?? 'No description',
        url: json["url"] ?? 'No url for this article',
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'No content',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  dynamic id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
