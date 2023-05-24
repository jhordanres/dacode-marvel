
import 'package:daco_marvel/model/stories.dart';
import 'package:daco_marvel/view_model/provider/hero_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daco_marvel/model/series.dart';

class AparitionStories extends StatelessWidget {
  final List<Storie> storie;
  final int idHero;

  const AparitionStories(
      {super.key, required this.storie, required this.idHero});

  @override
  Widget build(BuildContext context) {
    final heroProvider = Provider.of<HerosProvider>(context, listen: false);

    return FutureBuilder(
      future: heroProvider.getHeroStorie(idHero),
      builder: (_, AsyncSnapshot<List<Storie>> snapshot) {
        print(snapshot.error);
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 190,
            child: CupertinoActivityIndicator(),
          );
        }
        final List<Storie> storie = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: storie.length,
            itemBuilder: (_, int index) {
              if (storie.isNotEmpty) {
                return _ApariCard(storie: storie[index]);
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
  final Storie storie;
  const _ApariCard({Key? key, required this.storie}) : super(key: key);

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
              image: NetworkImage(storie.fullPoster),
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          SizedBox(height: 5),
          Text(
            storie.title!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
