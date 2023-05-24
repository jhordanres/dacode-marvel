import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Heros> heros;
  const CardSwiper({Key? key, required this.heros}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: heros.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, index) {
          final hero = heros[index];
          print(hero.fullPost);
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: hero),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/marvel-placeholder.jpeg'),
                image: NetworkImage(hero.fullPost),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
