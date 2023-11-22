import 'package:flutter/material.dart';
import 'package:games_app_ap/providers/games_providers.dart';
import 'package:games_app_ap/widgets/card_swiper.dart';
import 'package:games_app_ap/widgets/movie_slider.dart';
import 'package:games_app_ap/widgets/search.dart';
import 'package:games_app_ap/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gamesProvider = Provider.of<GamesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videojocs'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
               showSearch(
                context: context,
                delegate: Search(context, gamesProvider.OnDisplayGame),
              );
              }, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(juegos: gamesProvider.OnDisplayGame),

              // Slider de pel·licules
              MovieSlider(
                  nom: 'Popular Last 30 days', juegos: gamesProvider.OnDisplayGame),
              const SizedBox(height: 20),
              MovieSlider(
                  nom: 'Popular Nintendo switch', juegos: gamesProvider.OnDisplayNintendoGames),
              const SizedBox(height: 20),
              MovieSlider(
                  nom: 'Popular Xbox', juegos: gamesProvider.onDisplayXboxGames),
                  const SizedBox(height: 20),
              MovieSlider(
                  nom: 'Popular Play', juegos: gamesProvider.onDisplayPlayGames),
            ],
          ),
        ),
      ),
    );
  }
}
