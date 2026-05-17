enum VideoType { network, m3u8 }

class Video {
  final String id;
  final String url;
  final VideoType videoType;
  final String title;
  final int likes;
  final int comments;
  final String thumbnailUrl;
  final Author author;
  final String description;
  final List<String> tags;
  final String uploadDate;
  final String location;
  final int views;

  Video({
    required this.id,
    required this.url,
    this.videoType = VideoType.network,
    required this.title,
    required this.likes,
    required this.comments,
    required this.thumbnailUrl,
    required this.author,
    required this.description,
    required this.tags,
    required this.uploadDate,
    required this.location,
    required this.views,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"],
      url: json["url"],
      videoType: json["videoType"] == "m3u8" ? VideoType.m3u8 : VideoType.network,
      title: json["title"],
      likes: json["likes"],
      comments: json["comments"],
      thumbnailUrl: json["thumbnailUrl"] ?? "",
      author: Author.fromJson(json["author"] ?? {}), // Dentro de Video.fromJson, na linha author:
      // json["author"], vai dar um erro de tipo. O json["author"]
      //vem da internet como um Map<String, dynamic>, mas o seu modelo
      //espera um objeto do tipo Author.
      description: json["description"] ?? "",
      tags: List<String>.from(json["tags"] ?? []),
      uploadDate: json["uploadDate"] ?? "",
      location: json["location"] ?? "",
      views: json["views"] ?? 0,
    );
  }
}

class Author {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isVerified;

  Author({required this.id, required this.name, required this.avatarUrl, required this.isVerified});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] ?? "",
      name: json['name'] ?? "Usuário",
      avatarUrl: json['avatarUrl'] ?? "",
      isVerified: json['isVerified'] ?? false,
    );
  }
}
