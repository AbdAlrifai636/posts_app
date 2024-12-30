import 'dart:convert';


class PostsModel {
  DateTime createdAt;
  String userName;
  String avatar;
  DateTime time;
  String content;
  int likes;
  String comments;
  String id;

  PostsModel({
    required this.createdAt,
    required this.userName,
    required this.avatar,
    required this.time,
    required this.content,
    required this.likes,
    required this.comments,
    required this.id,
  });

  factory PostsModel.fromRawJson(String str) => PostsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    createdAt: DateTime.parse(json["createdAt"]),
    userName: json["user_name"],
    avatar: json["avatar"],
    time: DateTime.parse(json["time"]),
    content: json["content"],
    likes: json["likes"],
    comments: json["comments"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "user_name": userName,
    "avatar": avatar,
    "time": time.toIso8601String(),
    "content": content,
    "likes": likes,
    "comments": comments,
    "id": id,
  };
  static List<PostsModel> jsonArray(List<dynamic> list) {
    return list.map((item) => PostsModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return 'PostsModel(createdAt: $createdAt, userName: $userName, avatar: $avatar, time: $time, content: $content, likes: $likes, comments: $comments, id: $id)';
  }
}
