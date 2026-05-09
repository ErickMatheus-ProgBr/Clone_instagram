// 1. O MODELO (O molde do seu post)
class PostModel {
  final int userId; // Na API original é int
  final int id; // Na API original é int
  String? imageUrl;
  final String title;
  final String body;
  String? username;

  PostModel({
    required this.userId,
    required this.id,
    this.imageUrl,
    required this.title,
    required this.body,
    this.username,
  });

  // Fábrica que transforma o JSON da internet em um objeto Dart
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"] ?? 0, // Se for nulo, vira o número 0
      id: json["id"] ?? 0, // Se for nulo, vira o número 0
      imageUrl: null, // Começa nulo e o Provider preenche depois
      title: json["title"] ?? '', // Texto vazio se for nulo
      body: json["body"] ?? '', // Texto vazio se for nulo
      username: null, // Começa nulo e o Provider preenche depois
    );
  }
}
