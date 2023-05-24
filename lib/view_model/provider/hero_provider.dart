import 'dart:convert';

import 'package:daco_marvel/config/constants/enviroment.dart';
import 'package:daco_marvel/model/comics_response.dart';
import 'package:daco_marvel/model/hero_characters_response.dart';
import 'package:daco_marvel/model/models.dart';
import 'package:daco_marvel/model/series_response.dart';
import 'package:daco_marvel/model/stories_response.dart';
import 'package:flutter/material.dart';
import 'package:daco_marvel/model/stories.dart';

import 'package:http/http.dart' as http;

class HerosProvider extends ChangeNotifier {
  String _apiKey = 'fea4ddbf370376865724c2b03db5ffef';
  String _baseUrl = 'gateway.marvel.com';
  String _hash = 'c3de3454e8dc6486f0e30e8f937745fe';
  String _ts = '1677784856';

  List<Heros> onDisplayHero = [];
  List<Event> onDisplayEvent = [];
  List<Comic> onDisplayComic = [];
  List<Seriee> onDisplaySerie = [];
  List<Storie> onDisplayStorie = [];
  Map<int, List<Event>> heroEvent = {};
  Map<int, List<Comic>> heroComic = {};
  Map<int, List<Seriee>> heroSerie = {};
  Map<int, List<Storie>> heroStorie = {};

  HerosProvider() {
    this.getHerosOnDisplay();
    this.getEventOnDisplay();
  }

  Future<String> _getJsonData(String endpoint) async {
    
    var url = Uri.https(
            _baseUrl, endpoint, {'apikey': _apiKey, 'hash': _hash, 'ts': _ts})
        .replace(port: 443);

    final response = await http.get(url);
    return response.body;
  }

  getHerosOnDisplay() async {
    final jsonDate = await _getJsonData('/v1/public/characters');
    final heroCharactersResponse = HeroCharactersResponse.fromJson(jsonDate);

    print(heroCharactersResponse.data!.results![0].name);

    onDisplayHero = heroCharactersResponse.data!.results!;

    notifyListeners();
  }

  getEventOnDisplay() async {
    final jsonData = await _getJsonData('/v1/public/characters/1011334/events');
    final eventResponse = EventsResponse.fromJson(jsonData);

    print(eventResponse.data!.results![0].title);

    onDisplayEvent = eventResponse.data!.results!;

    notifyListeners();
  }

  Future<List<Event>> getHeroEvent(int heroId) async {

    if(heroEvent.containsKey(heroId)) return heroEvent[heroId]!;
    final jsonData = await _getJsonData('/v1/public/characters/$heroId/events');
    final eventResponse = EventsResponse.fromJson(jsonData);

    heroEvent[heroId] = eventResponse.data!.results!;
    return eventResponse.data!.results!;
  }

  Future<List<Comic>> getHeroComic(int heroId) async {

    //if(heroComic.containsKey(heroId)) return heroComic[heroId]!;
    final jsonData = await _getJsonData('/v1/public/characters/$heroId/comics');
    final comicResponse = ComicsResponse.fromJson(jsonData);

    heroComic[heroId] = comicResponse.data!.results!;
    return comicResponse.data!.results!;
  }

  Future<List<Seriee>> getHeroSeries(int heroId) async {

    //if(heroSerie.containsKey(heroId)) return heroSerie[heroId]!;
    final jsonData = await _getJsonData('/v1/public/characters/$heroId/series');
    //print(jsonData);
    final seriesResponse = SeriesResponse.fromJson(jsonData);

    heroSerie[heroId] = seriesResponse.data!.results!;

    return seriesResponse.data!.results!;
  }

  Future<List<Storie>> getHeroStorie(int heroId) async {

    //if(heroStorie.containsKey(heroId)) return heroStorie[heroId]!;
    final jsonData = await _getJsonData('/v1/public/characters/$heroId/stories');
    //print(jsonData);
    final storiesResponse = StoriesResponse.fromJson(jsonData);

    heroStorie[heroId] = storiesResponse.data!.results!;

    return storiesResponse.data!.results!;
  }
}
