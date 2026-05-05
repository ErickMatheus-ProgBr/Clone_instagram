import 'package:flutter/material.dart';

class PostModel {
  final String userImage;
  final String userName;
  final String postImage;
  final String caption;

  PostModel({
    required this.userImage,
    required this.userName,
    required this.postImage,
    required this.caption,
  });
}
