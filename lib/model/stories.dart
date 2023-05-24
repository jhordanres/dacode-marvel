import 'dart:convert';

import 'package:daco_marvel/model/hero_characters_response.dart';
import 'package:daco_marvel/model/stories_response.dart';

class Storie {
    int? id;
    String? title;
    String? description;
    String? resourceUri;
    String? type;
    String? modified;
    Thumbnail? thumbnail;
    Creators? creators;
    Characters? characters;
    Characters? series;
    Characters? comics;
    Characters? events;
    OriginalIssue? originalIssue;

    get fullPoster {
      if(this.thumbnail != null){
        return '${thumbnail!.path! +'.'+thumbnail!.extension!}';
      }else{
        return 'https://i.stack.imgur.com/GNHx0.png';
      }
  }

    Storie({
        this.id,
        this.title,
        this.description,
        this.resourceUri,
        this.type,
        this.modified,
        this.thumbnail,
        this.creators,
        this.characters,
        this.series,
        this.comics,
        this.events,
        this.originalIssue,
    });

    factory Storie.fromJson(String str) => Storie.fromMap(json.decode(str));

    factory Storie.fromMap(Map<String, dynamic> json) => Storie(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        creators: Creators.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
        series: Characters.fromMap(json["series"]),
        comics: Characters.fromMap(json["comics"]),
        events: Characters.fromMap(json["events"]),
        originalIssue: OriginalIssue.fromMap(json["originalIssue"]),
    );
}