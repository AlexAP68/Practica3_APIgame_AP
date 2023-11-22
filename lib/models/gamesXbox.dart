import 'package:games_app_ap/models/models.dart';

class GamesXbox {
    int? count;
    dynamic next;
    dynamic previous;
    List<Juego> results;
    bool userPlatforms;

    GamesXbox({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
        required this.userPlatforms,
    });

    factory GamesXbox.fromJson(String str) => GamesXbox.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GamesXbox.fromMap(Map<String, dynamic> json) => GamesXbox(
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