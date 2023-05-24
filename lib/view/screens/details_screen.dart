import 'package:daco_marvel/model/hero.dart';
import 'package:daco_marvel/view/widgets/apparittion_comics.dart';
import 'package:daco_marvel/view/widgets/apparittion_stories.dart';
import 'package:daco_marvel/view/widgets/widgets.dart';
import 'package:daco_marvel/view_model/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  static const name = 'details';

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por instancia de HERO
    final eventProvider = Provider.of<HerosProvider>(context);
    final Heros hero = ModalRoute.of(context)?.settings.arguments as Heros;
    print(hero.name);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          heros: hero,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _PostAndTitle(heros: hero,),
            _OverView(heros: hero),
            TitleSeccion(title: 'Eventos',),
            AparitionCards(idHero: hero.id!,
              events: eventProvider.onDisplayEvent,
            ),
            TitleSeccion(title: 'Comics'),
            SizedBox(height: 5),
            AparitionComics(idHero: hero.id!,
              comic: eventProvider.onDisplayComic,
            ),
            TitleSeccion(title: 'Series'),
            SizedBox(height: 5),
            AparitionSeeries(idHero: hero.id!, serie: eventProvider.onDisplaySerie),
            TitleSeccion(title: 'Historias'),
            SizedBox(height: 5),
            AparitionStories(idHero: hero.id!, storie: eventProvider.onDisplayStorie)
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Heros heros;
  const _CustomAppBar({Key? key, required this.heros}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
            padding: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: Text(
              heros.name!,
              style: TextStyle(fontSize: 16),
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading-marvel.gif'),
          image: NetworkImage(heros.fullPost),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PostAndTitle extends StatelessWidget {
  final Heros heros;
  const _PostAndTitle({
    Key? key,
    required this.heros
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    String dateTimeString = heros.modified!;
    String dateString = dateTimeString.substring(0, dateTimeString.indexOf('T'));
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading-marvel.gif'),
              image: NetworkImage(heros.fullPost),
              fit: BoxFit.fill,
              height: 150,
              width: 110,
            ),
          ),
          SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heros.name!,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
                Text('Modificado: '+dateString,
                    style: textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2)
                
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final Heros heros;

  const _OverView({
    super.key, 
    required this.heros
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Text(
        heros.description!.isNotEmpty == true
        ? heros.description!
        : 'Este heroe no tiene descipción ', 
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
