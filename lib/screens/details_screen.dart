import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:games_app_ap/models/models.dart';
import 'package:games_app_ap/providers/games_providers.dart';
import 'package:games_app_ap/widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Juego juego = ModalRoute.of(context)?.settings.arguments as Juego;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(juego: juego),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(juego: juego),
                _Overview(overview: juego.id),
                _Plataforms(platforms: juego.platforms),
                _Genres(genres: juego.genres),
                 
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Juego juego;

  const _CustomAppBar({Key? key, required this.juego}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomCenter,
            child: Text(
              juego.name,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        background: CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: juego.shortScreenshots.map((screenshot) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    screenshot.image,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  final Juego juego;

   const _PosterAndTitle({super.key, required this.juego});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  juego.name,
                  style: const TextStyle(fontSize: 22),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      juego.rating.toString(),
                      style: textTheme.caption,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class _Overview extends StatelessWidget {
  final int overview;

  const _Overview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GamesProvider().getGameDetails(overview),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras espera, puedes mostrar un indicador de carga
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {

          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
               snapshot.data ?? '', 
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        }
      },
    );
  }
}


class _Plataforms extends StatelessWidget {
  final List<Platform> platforms;

  const _Plataforms({super.key, required this.platforms});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Platforms:',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: platforms.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                platforms[index].platform.name,
                style: Theme.of(context).textTheme.bodyText1,
              );
            },
          ),
        ],
      ),
    );
  }
}


class _Genres extends StatelessWidget {
  final List<Genre> genres;

  const _Genres({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genres:',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: genres.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                genres[index].name,
                style: Theme.of(context).textTheme.bodyText1,
              );
            },
          ),
        ],
      ),
    );
  }
}

