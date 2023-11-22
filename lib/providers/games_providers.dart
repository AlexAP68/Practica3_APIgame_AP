import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:games_app_ap/models/gamesXbox.dart';
import 'package:games_app_ap/models/gamesdecripcion.dart';

import 'package:games_app_ap/models/gamesnintendo.dart';


import '../models/models.dart';
export 'package:games_app_ap/models/games.dart';


class GamesProvider extends ChangeNotifier {
  String _baseUrl = "api.rawg.io";
  String _apiKey = "6abbf87bff9740b5aa07f5cdeba26d92";
  String _dates = "2023-10-20,2023-11-20.";
  String _dates_year = "2023-01-01,2023-12-31.";



  List<Juego> OnGames = [];
  List<Juego> OnDisplayGame = [];
  List<Juego> OnDisplayNintendoGames = [];
   List<Juego> onDisplayXboxGames = [];
  List<Juego> onDisplayPlayGames = [];




  GamesProvider(){
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

      OnDisplayNintendoGames = nintendogames.results;

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

      final playgames = GamesXbox.fromJson(result.body);

      onDisplayPlayGames = playgames.results;

      notifyListeners();
    } catch (error) {
      print('Error en getOnPlayGames: $error');
    }
  }

  Future<List<Juego>> getGamesBySearch(String adult, String query) async {
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
   
    final gamedescripcion = gameresponse.descriptionRaw.toString();

    return gamedescripcion;
  } else {
    // Manejar el caso en el que la solicitud no sea exitosa
    throw Exception('Failed to load game details');
  }
}

}