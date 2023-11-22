import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:games_app_ap/models/models.dart';



class CardSwiper extends StatelessWidget {

    final List<Juego> juegos;

  const CardSwiper({Key? key, required this.juegos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if(juegos.length == 0){
      return Container(
        width: double.infinity,
        height: size.height*0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
        width: 500,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: juegos.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.9,
          itemHeight: size.height * 0.2,
          itemBuilder: (BuildContext context, int index) {
          final juego = juegos[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: juego),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(juego.IconImage),
                    fit: BoxFit.contain, ),
              ),
            );
          },
        ));
  }
}
