import 'package:daco_marvel/model/models.dart';
import 'package:daco_marvel/view_model/provider/hero_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AparitionCards extends StatelessWidget {
  final List<Event> events;
  final int idHero;

  const AparitionCards({super.key, required this.events, required this.idHero});

  @override
  Widget build(BuildContext context) {
    final heroProvider = Provider.of<HerosProvider>(context, listen: false);

    return FutureBuilder(
      future: heroProvider.getHeroEvent(idHero),
      builder: (_, AsyncSnapshot<List<Event>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 190,
            child: CupertinoActivityIndicator(),
          );
        }
        final List<Event> event = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (_, int index) {
              if (event.isNotEmpty) {
                return _ApariCard(events: event[index]);
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
                          placeholder: AssetImage('assets/loading-marvel.gif'),
                          image: AssetImage('assets/loading-marvel.gif'),
                          fit: BoxFit.cover,
                          height: 140,
                          width: 100,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Sin eventos',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  )
                );
              }
            },
          ),
        );
      },
    );
  }
}

class _ApariCard extends StatelessWidget {
  final Event events;
  const _ApariCard({Key? key, required this.events}) : super(key: key);

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
              image: NetworkImage(events.fullPoster),
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          SizedBox(height: 5),
          Text(
            events.title!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
