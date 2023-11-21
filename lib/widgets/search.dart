import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

import 'package:movies_app/providers/movies_providers.dart';
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
    final moviesProvider = Provider.of<MoviesProvider>(_context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMoviesBySearch("true", query),
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

    for (var movie in juegos) {
      if (movie.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(movie);
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
