import 'package:meta/meta.dart';
import 'dart:convert';

class UjianResponseModel {
  final String message;
  //timer
  final int timer;
  final List<Soal> data;

  UjianResponseModel({
    required this.message,
    required this.data,
    required this.timer,
  });

  factory UjianResponseModel.fromJson(String str) =>
      UjianResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UjianResponseModel.fromMap(Map<String, dynamic> json) =>
      UjianResponseModel(
        message: json["message"],
        timer: json["timer"] ?? 0,
        data: List<Soal>.from(json["data"].map((x) => Soal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Soal {
  final int id;
  final String pertanyaan;
  final String kategori;
  final String jawabanA;
  final String jawabanB;
  final String jawabanC;
  final String jawabanD;

  Soal({
    required this.id,
    required this.pertanyaan,
    required this.kategori,
    required this.jawabanA,
    required this.jawabanB,
    required this.jawabanC,
    required this.jawabanD,
  });

  factory Soal.fromJson(String str) => Soal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Soal.fromMap(Map<String, dynamic> json) => Soal(
        id: json["id"],
        pertanyaan: json["pertanyaan"],
        kategori: json["kategori"],
        jawabanA: json["jawaban_a"],
        jawabanB: json["jawaban_b"],
        jawabanC: json["jawaban_c"],
        jawabanD: json["jawaban_d"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "pertanyaan": pertanyaan,
        "kategori": kategori,
        "jawaban_a": jawabanA,
        "jawaban_b": jawabanB,
        "jawaban_c": jawabanC,
        "jawaban_d": jawabanD,
      };
}
