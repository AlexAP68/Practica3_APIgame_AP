import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/gamesXbox.dart';
import 'package:movies_app/models/gamesdecripcion.dart';

import 'package:movies_app/models/gamesnintendo.dart';


import '../models/models.dart';
export 'package:movies_app/models/games.dart';


class MoviesProvider extends ChangeNotifier {
  String _baseUrl = "api.rawg.io";
  String _apiKey = "6abbf87bff9740b5aa07f5cdeba26d92";
  String _dates = "2023-10-20,2023-11-20.";
  String _dates_year = "2023-01-01,2023-12-31.";



  List<Juego> OnGames = [];
  List<Juego> OnDisplayGame = [];
  List<Juego> onDisplayPopularMovies = [];
   List<Juego> onDisplayXboxGames = [];
  List<Juego> onDisplayPlayGames = [];




  MoviesProvider(){
    print("Movies Provider iniciado");
    this.getOnDisplayGames();
    this.getOnDisplayNintendoGames();
    this.getOnDisplayXboxGames();
    this.getOnDisplayPlayGames();
  }


Future<void> getOnDisplayGames() async {
    print('getOnDisplayMovies');
    var url = Uri.https(_baseUrl, '/api/games', {
      'key': _apiKey,
      'dates': _dates,
    });

    try {
      final result = await http.get(url);

      final lastgames = Games.fromJson(result.body);

      OnDisplayGame = lastgames.result;

      notifyListeners();
    } catch (error) {
      print('Error en getOnDisplayMovies: $error');
    }
  }

  Future<void> getOnDisplayNintendoGames() async {
    print('getOnPopularsMovies');
    var url = Uri.https(_baseUrl, '/api/games', {
      'key': _apiKey,
      'platforms': '7', 
      'dates': _dates_year,
    });

    try {
      final result = await http.get(url);

      final nintendogames = Gamesnintendo.fromJson(result.body);

      onDisplayPopularMovies = nintendogames.results;

      notifyListeners();
    } catch (error) {
      print('Error en getOnDisplayPopularMovies: $error');
    }
  }

    Future<void> getOnDisplayXboxGames() async {
    print('getOnXboxGames');
    var url = Uri.https(_baseUrl, '/api/games', {
      'key': _apiKey,
      'platforms': '186', 
      'dates': _dates_year,
    });

    try {
      final result = await http.get(url);

      final xboxgames = GamesXbox.fromJson(result.body);

      onDisplayXboxGames = xboxgames.results;

      notifyListeners();
    } catch (error) {
      print('Error en getOnXboxGames: $error');
    }
  }

    Future<void> getOnDisplayPlayGames() async {
    print('getOnPlayGames');
    var url = Uri.https(_baseUrl, '/api/games', {
      'key': _apiKey,
      'platforms': '187', 
      'dates': _dates_year,
    });

    try {
      final result = await http.get(url);

      final xboxgames = GamesXbox.fromJson(result.body);

      onDisplayPlayGames = xboxgames.results;

      notifyListeners();
    } catch (error) {
      print('Error en getOnPlayGames: $error');
    }
  }

  Future<List<Juego>> getMoviesBySearch(String adult, String query) async {
    print('Cercant pelis al servidor...');
    var url = Uri.https(_baseUrl, '/api/games', {
      'key': _apiKey,
      'dates': _dates,
    });

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final moviesBySearchResponse =Games.fromJson(result.body);

    return moviesBySearchResponse.result;
  }

  Future<String> getGameDetails(int gameId) async {
  print('Fetching game details');
  var url = Uri.https(_baseUrl, '/api/games/$gameId', {
    'key': _apiKey,
  });

  final result = await http.get(url);

  if (result.statusCode == 200) {
    final gameresponse = GamesDescripcion.fromJson(result.body);
   
    final gamedescripcion = gameresponse.description.toString();
    return gamedescripcion;
  } else {
    // Manejar el caso en el que la solicitud no sea exitosa
    throw Exception('Failed to load game details');
  }
}



 /*getOnTopRatedMovies() async {
    print('getOnTopRatedMovies');
    var url = Uri.https(
      _baseUrl,
      '3/movie/top_rated',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': _page,
      },
    );

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final topRatedResponse = TopRatedResponse.fromRawJson(result.body);

    topRatedMovies = topRatedResponse.results;

    notifyListeners();
  }

  getOnUpcomingMovies() async {
    print('getOnUpcomingMovies');
    var url = Uri.https(
      _baseUrl,
      '3/movie/upcoming',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': _page,
      },
    );

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final upcomingResponse = UpcomingResponse.fromRawJson(result.body);

    upcomingMovies = upcomingResponse.results;

    notifyListeners();
  }

Future<List<Movie>> getMoviesBySearch(String adult, String query) async {
    print('Cercant pelis al servidor...');
    var url = Uri.https(
      _baseUrl,
      '3/search/movie',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': _page,
        'query': query,
        'include_adult': adult
      },
    );

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final moviesBySearchResponse =
        MoviesBySearchResponse.fromRawJson(result.body);

    return moviesBySearchResponse.results;
  }*/
}