import 'package:flutter/material.dart';
import 'package:games_app_ap/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Juego> juegos;
  final String nom;

  const MovieSlider({super.key, required this.juegos, required this.nom});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(nom,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: juegos.length,
                itemBuilder: (_, int index) => _MoviePoster(
                      juego: juegos[index],
                    )),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Juego juego;

  const _MoviePoster({super.key, required this.juego});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: juego),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(juego.IconImage),
                width: 130,
                height: 190,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            juego.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
