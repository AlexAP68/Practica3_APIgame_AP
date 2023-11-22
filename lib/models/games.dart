import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:games_app_ap/models/models.dart';

class Games extends ChangeNotifier {
    int count;
    String next;
    dynamic previous;
    List<Juego> result;
    bool? userPlatforms;

    Games({
        required this.count,
        required this.next,
        required this.previous,
        required this.result,
        required this.userPlatforms,
    });

    factory Games.fromJson(String str) => Games.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Games.fromMap(Map<String, dynamic> json) => Games(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        result: List<Juego>.from(json["results"].map((x) => Juego.fromMap(x))),
        userPlatforms: json["user_platforms"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(result.map((x) => x.toMap())),
        "user_platforms": userPlatforms,
    };
}

