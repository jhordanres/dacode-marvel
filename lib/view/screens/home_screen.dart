import 'package:daco_marvel/view/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WORLD MARVEL'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: (){}, 
          )
        ],
      ),
      body: Column(
        children: [

          //Card-swiper de heroes
          CardSwiper()
        ],
      )
    );
  }
}