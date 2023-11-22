import 'dart:convert';

import 'package:games_app_ap/models/models.dart';

class Gamesnintendo {
    int count;
    String next;
    dynamic previous;
    List<Juego> results;
    bool userPlatforms;

    Gamesnintendo({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
        required this.userPlatforms,
    });

    factory Gamesnintendo.fromJson(String str) => Gamesnintendo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Gamesnintendo.fromMap(Map<String, dynamic> json) => Gamesnintendo(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Juego>.from(json["results"].map((x) => Juego.fromMap(x))),
        userPlatforms: json["user_platforms"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "user_platforms": userPlatforms,
    };
}
