import 'dart:convert';

class Juego {
    String slug;
    String name;
    int playtime;
    List<Platform> platforms;
    List<Store>? stores;
    DateTime released;
    bool tba;
    String? backgroundImage;
    double rating;
    int ratingTop;
    List<Rating> ratings;
    int ratingsCount;
    int reviewsTextCount;
    int added;
    AddedByStatus addedByStatus;
    dynamic metacritic;
    int suggestionsCount;
    String updated;
    int id;
    dynamic score;
    dynamic clip;
    List<Tag> tags;
    EsrbRating? esrbRating;
    dynamic userGame;
    int reviewsCount;
    String saturatedColor;
    String dominantColor;
    List<ShortScreenshot> shortScreenshots;
    List<Platform> parentPlatforms;
    List<Genre> genres;
    int? communityRating;

    Juego({
        required this.slug,
        required this.name,
        required this.playtime,
        required this.platforms,
        required this.stores,
        required this.released,
        required this.tba,
        required this.backgroundImage,
        required this.rating,
        required this.ratingTop,
        required this.ratings,
        required this.ratingsCount,
        required this.reviewsTextCount,
        required this.added,
        required this.addedByStatus,
        required this.metacritic,
        required this.suggestionsCount,
        required this.updated,
        required this.id,
        required this.score,
        required this.clip,
        required this.tags,
        required this.esrbRating,
        required this.userGame,
        required this.reviewsCount,
        required this.saturatedColor,
        required this.dominantColor,
        required this.shortScreenshots,
        required this.parentPlatforms,
        required this.genres,
        this.communityRating,
    });

        String get IconImage {
  final String? originalImageUrl = this.backgroundImage;
  final List<String> characters = originalImageUrl?.split("/") ?? [];
  final defaultImageUrl = "https://i.stack.imgur.com/GNhx0.png";

  if (originalImageUrl != null && characters.length >= 7) {
    try {
      // Redimensionar la imagen a 500x800 píxeles
      final resizedImageUrl = "${characters[0]}/${characters[1]}/${characters[2]}/${characters[3]}/resize/420/-/${characters[4]}/${characters[5]}/${characters[6]}";
      return resizedImageUrl;
    } catch (e) {
      print("Error al redimensionar la imagen: $e");
      return defaultImageUrl;
    }
  } else {
    // Si no hay imagen o la URL no tiene la estructura esperada, devuelve la imagen predeterminada
    return defaultImageUrl;
  }
}

    factory Juego.fromJson(String str) => Juego.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Juego.fromMap(Map<String, dynamic> json) => Juego(
        slug: json["slug"],
        name: json["name"],
        playtime: json["playtime"],
        platforms: List<Platform>.from(json["platforms"].map((x) => Platform.fromMap(x))),
        stores: json["stores"] == null ? [] : List<Store>.from(json["stores"]!.map((x) => Store.fromMap(x))),
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: AddedByStatus.fromMap(json["added_by_status"]),
        metacritic: json["metacritic"],
        suggestionsCount: json["suggestions_count"],
        updated: json["updated"],
        id: json["id"],
        score: json["score"],
        clip: json["clip"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
        esrbRating: json["esrb_rating"] == null ? null : EsrbRating.fromMap(json["esrb_rating"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        shortScreenshots: List<ShortScreenshot>.from(json["short_screenshots"].map((x) => ShortScreenshot.fromMap(x))),
        parentPlatforms: List<Platform>.from(json["parent_platforms"].map((x) => Platform.fromMap(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        communityRating: json["community_rating"],
    );

    Map<String, dynamic> toMap() => {
        "slug": slug,
        "name": name,
        "playtime": playtime,
        "platforms": List<dynamic>.from(platforms.map((x) => x.toMap())),
        "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toMap())),
        "released": "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toMap())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus.toMap(),
        "metacritic": metacritic,
        "suggestions_count": suggestionsCount,
        "updated": updated,
        "id": id,
        "score": score,
        "clip": clip,
        "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
        "esrb_rating": esrbRating?.toMap(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "short_screenshots": List<dynamic>.from(shortScreenshots.map((x) => x.toMap())),
        "parent_platforms": List<dynamic>.from(parentPlatforms.map((x) => x.toMap())),
        "genres": List<dynamic>.from(genres.map((x) => x.toMap())),
        "community_rating": communityRating,
    };
}

class AddedByStatus {
    int? yet;
    int? owned;
    int? beaten;
    int? toplay;
    int? dropped;
    int? playing;

    AddedByStatus({
        this.yet,
        this.owned,
        this.beaten,
        this.toplay,
        this.dropped,
        this.playing,
    });

    factory AddedByStatus.fromJson(String str) => AddedByStatus.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddedByStatus.fromMap(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
    );

    Map<String, dynamic> toMap() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}

class EsrbRating {
    int id;
    String name;
    String slug;
    String nameEn;
    String nameRu;

    EsrbRating({
        required this.id,
        required this.name,
        required this.slug,
        required this.nameEn,
        required this.nameRu,
    });

    factory EsrbRating.fromJson(String str) => EsrbRating.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EsrbRating.fromMap(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        nameEn: json["name_en"],
        nameRu: json["name_ru"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "name_en": nameEn,
        "name_ru": nameRu,
    };
}

class Genre {
    int id;
    String name;
    String slug;

    Genre({
        required this.id,
        required this.name,
        required this.slug,
    });

    factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Platform {
    Genre platform;

    Platform({
        required this.platform,
    });

    factory Platform.fromJson(String str) => Platform.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Platform.fromMap(Map<String, dynamic> json) => Platform(
        platform: Genre.fromMap(json["platform"]),
    );

    Map<String, dynamic> toMap() => {
        "platform": platform.toMap(),
    };
}

class Rating {
    int id;
    String title;
    int count;
    double percent;

    Rating({
        required this.id,
        required this.title,
        required this.count,
        required this.percent,
    });

    factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
    };
}

class ShortScreenshot {
    int id;
    String image;

    ShortScreenshot({
        required this.id,
        required this.image,
    });

    factory ShortScreenshot.fromJson(String str) => ShortScreenshot.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ShortScreenshot.fromMap(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
    };
}

class Store {
    Genre store;

    Store({
        required this.store,
    });

    factory Store.fromJson(String str) => Store.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Store.fromMap(Map<String, dynamic> json) => Store(
        store: Genre.fromMap(json["store"]),
    );

    Map<String, dynamic> toMap() => {
        "store": store.toMap(),
    };
}

class Tag {
    int id;
    String name;
    String slug;
    String language;
    int gamesCount;
    String imageBackground;

    Tag({
        required this.id,
        required this.name,
        required this.slug,
        required this.language,
        required this.gamesCount,
        required this.imageBackground,
    });

    factory Tag.fromJson(String str) => Tag.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        language: json["language"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "language": language,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}
