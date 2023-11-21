import 'dart:convert';

class GamesDescripcion {
    int id;
    String slug;
    String name;
    String nameOriginal;
    String description;
    int? metacritic;
    List<MetacriticPlatform> metacriticPlatforms;
    DateTime released;
    bool tba;
    String updated;
    String backgroundImage;
    String backgroundImageAdditional;
    String website;
    double rating;
    int ratingTop;
    List<Rating> ratings;
    Reactions reactions;
    int added;
    AddedByStatus addedByStatus;
    int playtime;
    int screenshotsCount;
    int moviesCount;
    int creatorsCount;
    int achievementsCount;
    int parentAchievementsCount;
    String redditUrl;
    String redditName;
    String redditDescription;
    String redditLogo;
    int redditCount;
    int twitchCount;
    int youtubeCount;
    int reviewsTextCount;
    int ratingsCount;
    int suggestionsCount;
    List<String> alternativeNames;
    String metacriticUrl;
    int parentsCount;
    int additionsCount;
    int gameSeriesCount;
    dynamic userGame;
    int reviewsCount;
    String saturatedColor;
    String dominantColor;
    List<ParentPlatform> parentPlatforms;
    List<PlatformElement> platforms;
    List<StoreElement> stores;
    List<Developer> developers;
    List<Developer> genres;
    List<Tag> tags;
    List<Developer> publishers;
    EsrbRating esrbRating;
    dynamic clip;
    String descriptionRaw;

    GamesDescripcion({
        required this.id,
        required this.slug,
        required this.name,
        required this.nameOriginal,
        required this.description,
        required this.metacritic,
        required this.metacriticPlatforms,
        required this.released,
        required this.tba,
        required this.updated,
        required this.backgroundImage,
        required this.backgroundImageAdditional,
        required this.website,
        required this.rating,
        required this.ratingTop,
        required this.ratings,
        required this.reactions,
        required this.added,
        required this.addedByStatus,
        required this.playtime,
        required this.screenshotsCount,
        required this.moviesCount,
        required this.creatorsCount,
        required this.achievementsCount,
        required this.parentAchievementsCount,
        required this.redditUrl,
        required this.redditName,
        required this.redditDescription,
        required this.redditLogo,
        required this.redditCount,
        required this.twitchCount,
        required this.youtubeCount,
        required this.reviewsTextCount,
        required this.ratingsCount,
        required this.suggestionsCount,
        required this.alternativeNames,
        required this.metacriticUrl,
        required this.parentsCount,
        required this.additionsCount,
        required this.gameSeriesCount,
        required this.userGame,
        required this.reviewsCount,
        required this.saturatedColor,
        required this.dominantColor,
        required this.parentPlatforms,
        required this.platforms,
        required this.stores,
        required this.developers,
        required this.genres,
        required this.tags,
        required this.publishers,
        required this.esrbRating,
        required this.clip,
        required this.descriptionRaw,
    });

    factory GamesDescripcion.fromJson(String str) => GamesDescripcion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GamesDescripcion.fromMap(Map<String, dynamic> json) => GamesDescripcion(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        metacriticPlatforms: List<MetacriticPlatform>.from(json["metacritic_platforms"].map((x) => MetacriticPlatform.fromMap(x))),
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        updated: json["updated"],
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
        reactions: Reactions.fromMap(json["reactions"]),
        added: json["added"],
        addedByStatus: AddedByStatus.fromMap(json["added_by_status"]),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        creatorsCount: json["creators_count"],
        achievementsCount: json["achievements_count"],
        parentAchievementsCount: json["parent_achievements_count"],
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        redditCount: json["reddit_count"],
        twitchCount: json["twitch_count"],
        youtubeCount: json["youtube_count"],
        reviewsTextCount: json["reviews_text_count"],
        ratingsCount: json["ratings_count"],
        suggestionsCount: json["suggestions_count"],
        alternativeNames: List<String>.from(json["alternative_names"].map((x) => x)),
        metacriticUrl: json["metacritic_url"],
        parentsCount: json["parents_count"],
        additionsCount: json["additions_count"],
        gameSeriesCount: json["game_series_count"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        parentPlatforms: List<ParentPlatform>.from(json["parent_platforms"].map((x) => ParentPlatform.fromMap(x))),
        platforms: List<PlatformElement>.from(json["platforms"].map((x) => PlatformElement.fromMap(x))),
        stores: List<StoreElement>.from(json["stores"].map((x) => StoreElement.fromMap(x))),
        developers: List<Developer>.from(json["developers"].map((x) => Developer.fromMap(x))),
        genres: List<Developer>.from(json["genres"].map((x) => Developer.fromMap(x))),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
        publishers: List<Developer>.from(json["publishers"].map((x) => Developer.fromMap(x))),
        esrbRating: EsrbRating.fromMap(json["esrb_rating"]),
        clip: json["clip"],
        descriptionRaw: json["description_raw"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "metacritic_platforms": List<dynamic>.from(metacriticPlatforms.map((x) => x.toMap())),
        "released": "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "updated": updated,
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toMap())),
        "reactions": reactions.toMap(),
        "added": added,
        "added_by_status": addedByStatus.toMap(),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "creators_count": creatorsCount,
        "achievements_count": achievementsCount,
        "parent_achievements_count": parentAchievementsCount,
        "reddit_url": redditUrl,
        "reddit_name": redditName,
        "reddit_description": redditDescription,
        "reddit_logo": redditLogo,
        "reddit_count": redditCount,
        "twitch_count": twitchCount,
        "youtube_count": youtubeCount,
        "reviews_text_count": reviewsTextCount,
        "ratings_count": ratingsCount,
        "suggestions_count": suggestionsCount,
        "alternative_names": List<dynamic>.from(alternativeNames.map((x) => x)),
        "metacritic_url": metacriticUrl,
        "parents_count": parentsCount,
        "additions_count": additionsCount,
        "game_series_count": gameSeriesCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "parent_platforms": List<dynamic>.from(parentPlatforms.map((x) => x.toMap())),
        "platforms": List<dynamic>.from(platforms.map((x) => x.toMap())),
        "stores": List<dynamic>.from(stores.map((x) => x.toMap())),
        "developers": List<dynamic>.from(developers.map((x) => x.toMap())),
        "genres": List<dynamic>.from(genres.map((x) => x.toMap())),
        "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
        "publishers": List<dynamic>.from(publishers.map((x) => x.toMap())),
        "esrb_rating": esrbRating.toMap(),
        "clip": clip,
        "description_raw": descriptionRaw,
    };
}

class AddedByStatus {
    int yet;
    int owned;
    int beaten;
    int toplay;
    int dropped;
    int playing;

    AddedByStatus({
        required this.yet,
        required this.owned,
        required this.beaten,
        required this.toplay,
        required this.dropped,
        required this.playing,
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

class Developer {
    int id;
    String name;
    String slug;
    int gamesCount;
    String imageBackground;

    Developer({
        required this.id,
        required this.name,
        required this.slug,
        required this.gamesCount,
        required this.imageBackground,
    });

    factory Developer.fromJson(String str) => Developer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Developer.fromMap(Map<String, dynamic> json) => Developer(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}

class EsrbRating {
    int id;
    String name;
    String slug;

    EsrbRating({
        required this.id,
        required this.name,
        required this.slug,
    });

    factory EsrbRating.fromJson(String str) => EsrbRating.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EsrbRating.fromMap(Map<String, dynamic> json) => EsrbRating(
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

class MetacriticPlatform {
    int metascore;
    String url;
    MetacriticPlatformPlatform platform;

    MetacriticPlatform({
        required this.metascore,
        required this.url,
        required this.platform,
    });

    factory MetacriticPlatform.fromJson(String str) => MetacriticPlatform.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MetacriticPlatform.fromMap(Map<String, dynamic> json) => MetacriticPlatform(
        metascore: json["metascore"],
        url: json["url"],
        platform: MetacriticPlatformPlatform.fromMap(json["platform"]),
    );

    Map<String, dynamic> toMap() => {
        "metascore": metascore,
        "url": url,
        "platform": platform.toMap(),
    };
}

class MetacriticPlatformPlatform {
    int platform;
    String name;
    String slug;

    MetacriticPlatformPlatform({
        required this.platform,
        required this.name,
        required this.slug,
    });

    factory MetacriticPlatformPlatform.fromJson(String str) => MetacriticPlatformPlatform.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MetacriticPlatformPlatform.fromMap(Map<String, dynamic> json) => MetacriticPlatformPlatform(
        platform: json["platform"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toMap() => {
        "platform": platform,
        "name": name,
        "slug": slug,
    };
}

class ParentPlatform {
    EsrbRating platform;

    ParentPlatform({
        required this.platform,
    });

    factory ParentPlatform.fromJson(String str) => ParentPlatform.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ParentPlatform.fromMap(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromMap(json["platform"]),
    );

    Map<String, dynamic> toMap() => {
        "platform": platform.toMap(),
    };
}

class PlatformElement {
    PlatformPlatform platform;
    DateTime releasedAt;
    Requirements requirements;

    PlatformElement({
        required this.platform,
        required this.releasedAt,
        required this.requirements,
    });

    factory PlatformElement.fromJson(String str) => PlatformElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlatformElement.fromMap(Map<String, dynamic> json) => PlatformElement(
        platform: PlatformPlatform.fromMap(json["platform"]),
        releasedAt: DateTime.parse(json["released_at"]),
        requirements: Requirements.fromMap(json["requirements"]),
    );

    Map<String, dynamic> toMap() => {
        "platform": platform.toMap(),
        "released_at": "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements": requirements.toMap(),
    };
}

class PlatformPlatform {
    int id;
    String name;
    String slug;
    dynamic image;
    dynamic yearEnd;
    int? yearStart;
    int gamesCount;
    String imageBackground;

    PlatformPlatform({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.yearEnd,
        required this.yearStart,
        required this.gamesCount,
        required this.imageBackground,
    });

    factory PlatformPlatform.fromJson(String str) => PlatformPlatform.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PlatformPlatform.fromMap(Map<String, dynamic> json) => PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}

class Requirements {
    String? minimum;
    String? recommended;

    Requirements({
        this.minimum,
        this.recommended,
    });

    factory Requirements.fromJson(String str) => Requirements.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Requirements.fromMap(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"],
    );

    Map<String, dynamic> toMap() => {
        "minimum": minimum,
        "recommended": recommended,
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

class Reactions {
    int? the1;
    int? the2;
    int? the3;
    int? the4;
    int? the5;
    int? the6;
    int? the7;
    int? the8;
    int? the9;
    int? the10;
    int? the11;
    int? the12;
    int? the13;
    int? the14;
    int? the15;
    int? the16;
    int? the18;
    int? the20;
    int? the21;

    Reactions({
        required this.the1,
        required this.the2,
        required this.the3,
        required this.the4,
        required this.the5,
        required this.the6,
        required this.the7,
        required this.the8,
        required this.the9,
        required this.the10,
        required this.the11,
        required this.the12,
        required this.the13,
        required this.the14,
        required this.the15,
        required this.the16,
        required this.the18,
        required this.the20,
        required this.the21,
    });

    factory Reactions.fromJson(String str) => Reactions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Reactions.fromMap(Map<String, dynamic> json) => Reactions(
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
        the6: json["6"],
        the7: json["7"],
        the8: json["8"],
        the9: json["9"],
        the10: json["10"],
        the11: json["11"],
        the12: json["12"],
        the13: json["13"],
        the14: json["14"],
        the15: json["15"],
        the16: json["16"],
        the18: json["18"],
        the20: json["20"],
        the21: json["21"],
    );

    Map<String, dynamic> toMap() => {
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
        "6": the6,
        "7": the7,
        "8": the8,
        "9": the9,
        "10": the10,
        "11": the11,
        "12": the12,
        "13": the13,
        "14": the14,
        "15": the15,
        "16": the16,
        "18": the18,
        "20": the20,
        "21": the21,
    };
}

class StoreElement {
    int id;
    String url;
    StoreStore store;

    StoreElement({
        required this.id,
        required this.url,
        required this.store,
    });

    factory StoreElement.fromJson(String str) => StoreElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StoreElement.fromMap(Map<String, dynamic> json) => StoreElement(
        id: json["id"],
        url: json["url"],
        store: StoreStore.fromMap(json["store"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "store": store.toMap(),
    };
}

class StoreStore {
    int id;
    String name;
    String slug;
    String domain;
    int gamesCount;
    String imageBackground;

    StoreStore({
        required this.id,
        required this.name,
        required this.slug,
        required this.domain,
        required this.gamesCount,
        required this.imageBackground,
    });

    factory StoreStore.fromJson(String str) => StoreStore.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StoreStore.fromMap(Map<String, dynamic> json) => StoreStore(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        domain: json["domain"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "domain": domain,
        "games_count": gamesCount,
        "image_background": imageBackground,
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
