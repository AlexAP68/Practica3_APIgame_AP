import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_providers.dart';
import 'package:movies_app/widgets/search.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartellera'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
               showSearch(
                context: context,
                delegate: Search(context, moviesProvider.OnDisplayGame),
              );
              }, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(movies: moviesProvider.OnDisplayGame),

              // Slider de pel·licules
              MovieSlider(
                  nom: 'Popular Last 30 days', movies: moviesProvider.OnDisplayGame),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              const SizedBox(height: 20),
              MovieSlider(
                  nom: 'Popular Nintendo switch', movies: moviesProvider.onDisplayPopularMovies),
              const SizedBox(height: 20),
              MovieSlider(
                  nom: 'Popular Xbox', movies: moviesProvider.onDisplayXboxGames),
                  const SizedBox(height: 20),
              MovieSlider(
                  nom: 'Popular Play', movies: moviesProvider.onDisplayPlayGames),
            ],
          ),
        ),
      ),
    );
  }
}
