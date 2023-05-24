import 'package:daco_marvel/view/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daco_marvel/view/widgets/widgets.dart';
import 'package:daco_marvel/view_model/provider/hero_provider.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {

    final heroProvider = Provider.of<HerosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('WORLD MARVEL'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: HeroSerachDelegate()), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            //Card-swiper de heroes
            CardSwiper(heros: heroProvider.onDisplayHero,),
      
            //Aquí van los heroes
            HeroSlider(heros: heroProvider.onDisplayHero,),
          ],
        ),
      )
    );
  }
}