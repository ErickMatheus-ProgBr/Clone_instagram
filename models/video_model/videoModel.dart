class Videomodel {
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

  Videomodel({
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

  factory Videomodel.fromJson(Map<String, dynamic> json) {
    return Videomodel(
      id: json["id"],
      url: json["url"],
      title: json["title"],
      likes: json["likes"],
      comments: json["commensts"],
      thumbnailUrl: json["thumbnailUrl"],
      author: json["author"],
      description: json["description"],
      tags: json["tags"],
      uploadDate: json["uploadDate"],
      location: json["location"],
      views: json["views"],
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
      id: json['id'],
      name: json['name'],
      avatarUrl: json['avatarUrl'],
      isVerified: json['isVerified'],
    );
  }
}
