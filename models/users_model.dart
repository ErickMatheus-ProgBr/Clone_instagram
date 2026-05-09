class UsersModel {
  final int id;
  final String userName;

  UsersModel({required this.id, required this.userName});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(id: json["id"], userName: json["username"]);
  }
}
