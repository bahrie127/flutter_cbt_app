import 'package:meta/meta.dart';
import 'dart:convert';

class MateriResponseModel {
    final String status;
    final List<Materi> data;

    MateriResponseModel({
        required this.status,
        required this.data,
    });

    factory MateriResponseModel.fromJson(String str) => MateriResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MateriResponseModel.fromMap(Map<String, dynamic> json) => MateriResponseModel(
        status: json["status"],
        data: List<Materi>.from(json["data"].map((x) => Materi.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Materi {
    final int id;
    final String title;
    final String content;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    Materi({
        required this.id,
        required this.title,
        required this.content,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Materi.fromJson(String str) => Materi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Materi.fromMap(Map<String, dynamic> json) => Materi(
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
