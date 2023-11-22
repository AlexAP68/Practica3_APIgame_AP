import 'package:flutter/material.dart';
import 'package:games_app_ap/models/models.dart';

import 'package:games_app_ap/providers/games_providers.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  final List<Juego> juegos;
  final BuildContext _context;

  Search(this._context, this.juegos);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final gamesProvider = Provider.of<GamesProvider>(_context, listen: false);
    return FutureBuilder(
      future: gamesProvider.getGamesBySearch("true", query),
      builder: (BuildContext context, AsyncSnapshot<List<Juego>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final matchQuery = snapshot.data!;

        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'details',
                    arguments: matchQuery[index]);
              },
              child: ListTile(
                title: Text(matchQuery[index].name),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Juego> matchQuery = [];

    for (var juego in juegos) {
      if (juego.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(juego);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'details',
                arguments: matchQuery[index]);
          },
          child: ListTile(
            title: Text(matchQuery[index].name),
          ),
        );
      },
    );
  }
}
