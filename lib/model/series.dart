import 'dart:convert';

import 'package:daco_marvel/model/series_response.dart';

class Seriee {
    int? id;
    String? title;
    String? description;
    String? resourceUri;
    List<Url>? urls;
    int? startYear;
    int? endYear;
    String? rating;
    String? type;
    String? modified;
    Thumbnail? thumbnail;
    Creators? creators;
    Characters? characters;
    Stories? stories;
    Characters? comics;
    Characters? events;
    Next? next;
    Next? previous;

    get fullPoster {
      if(this.thumbnail != null){
        return '${thumbnail!.path! +'.'+thumbnail!.extension!}';
      }else{
        return 'https://i.stack.imgur.com/GNHx0.png';
      }
  }

    Seriee({
        this.id,
        this.title,
        this.description,
        this.resourceUri,
        this.urls,
        this.startYear,
        this.endYear,
        this.rating,
        this.type,
        this.modified,
        this.thumbnail,
        this.creators,
        this.characters,
        this.stories,
        this.comics,
        this.events,
        this.next,
        this.previous,
    });

    factory Seriee.fromJson(String str) => Seriee.fromMap(json.decode(str));

    factory Seriee.fromMap(Map<String, dynamic> json) => Seriee(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        startYear: json["startYear"],
        endYear: json["endYear"],
        rating: json["rating"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        creators: Creators.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
        stories: Stories.fromMap(json["stories"]),
        comics: Characters.fromMap(json["comics"]),
        events: Characters.fromMap(json["events"]),
        next: Next.fromMap(json["next"]),
        previous: Next.fromMap(json["previous"]),
    );
}