import 'package:daco_marvel/model/models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeroSlider extends StatelessWidget {
  final List<Heros> heros;
  const HeroSlider({
    Key? key,
    required this.heros
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: heros.length,
                  itemBuilder: ((_, index) {
                    final hero = heros[index];
                    return _HeroPoster(heros: hero,);
                  })))
        ],
      ),
    );
  }
}

class _HeroPoster extends StatelessWidget {
  final Heros heros;
  const _HeroPoster({
    Key? key,
    required this.heros
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: heros),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/marvel-placeholder.jpeg'),
                image: NetworkImage(heros.fullPost),
                fit: BoxFit.fill,
                width: 120,
                height: 170,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            heros.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
