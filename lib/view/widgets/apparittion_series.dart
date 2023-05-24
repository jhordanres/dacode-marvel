
import 'package:daco_marvel/view_model/provider/hero_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daco_marvel/model/series.dart';

class AparitionSeeries extends StatelessWidget {
  final List<Seriee> serie;
  final int idHero;

  const AparitionSeeries(
      {super.key, required this.serie, required this.idHero});

  @override
  Widget build(BuildContext context) {
    final heroProvider = Provider.of<HerosProvider>(context, listen: false);

    return FutureBuilder(
      future: heroProvider.getHeroSeries(idHero),
      builder: (_, AsyncSnapshot<List<Seriee>> snapshot) {
        print(snapshot.error);
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 190,
            child: CupertinoActivityIndicator(),
          );
        }
        final List<Seriee> serie = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: serie.length,
            itemBuilder: (_, int index) {
              if (serie.isNotEmpty) {
                return _ApariCard(serie: serie[index]);
              } else {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 130,
                    height: 100,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder:
                                AssetImage('assets/loading-marvel.gif'),
                            image: AssetImage('assets/loading-marvel.gif'),
                            fit: BoxFit.cover,
                            height: 140,
                            width: 100,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sin comics',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      ],
                    ));
              }
            },
          ),
        );
      },
    );
  }
}

class _ApariCard extends StatelessWidget {
  final Seriee serie;
  const _ApariCard({Key? key, required this.serie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading-marvel.gif'),
              image: NetworkImage(serie.fullPoster),
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          SizedBox(height: 5),
          Text(
            serie.title!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
