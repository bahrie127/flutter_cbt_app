import 'package:meta/meta.dart';
import 'dart:convert';

class ContentResponseModel {
    final String status;
    final List<Content> data;

    ContentResponseModel({
        required this.status,
        required this.data,
    });

    factory ContentResponseModel.fromJson(String str) => ContentResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContentResponseModel.fromMap(Map<String, dynamic> json) => ContentResponseModel(
        status: json["status"],
        data: List<Content>.from(json["data"].map((x) => Content.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Content {
    final int id;
    final String title;
    final String content;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    Content({
        required this.id,
        required this.title,
        required this.content,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Content.fromMap(Map<String, dynamic> json) => Content(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
