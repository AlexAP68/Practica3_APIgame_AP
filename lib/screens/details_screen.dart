import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/movies_providers.dart';
import 'package:movies_app/widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Juego peli = ModalRoute.of(context)?.settings.arguments as Juego;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(peli: peli),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(peli: peli),
                _Overview(overview: peli.id),
                 //CastingCards(idMovie: peli.id),
                 
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Juego peli;

  const _CustomAppBar({super.key, required this.peli});

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
              peli.name,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(peli.IconImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Juego peli;

   const _PosterAndTitle({super.key, required this.peli});

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
                  peli.name,
                  style: const TextStyle(fontSize: 22),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  peli.slug,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      peli.rating.toString(),
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
      future: MoviesProvider().getGameDetails(overview),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras espera, puedes mostrar un indicador de carga
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // En caso de error, puedes mostrar un mensaje de error
          return Text('Error: ${snapshot.error}');
        } else {
          // Cuando la operación asincrónica está completa, muestra el resultado
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              snapshot.data ?? '', // snapshot.data puede ser nulo, así que usa ?? para manejarlo
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        }
      },
    );
  }
}
