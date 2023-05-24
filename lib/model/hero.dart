
import 'dart:convert';

import 'package:daco_marvel/model/hero_characters_response.dart';


class Heros {
    int? id;
    String? name;
    String? description;
    String? modified;
    Thumbnail? thumbnail;
    String? resourceUri;
    Comics? comics;
    Comics? series;
    Stories? stories;
    Comics? events;
    List<Url>? urls;

    get fullPost{
      return '${thumbnail!.path!+'.'+ thumbnail!.extension!}';
    }

    Heros({
        this.id,
        this.name,
        this.description,
        this.modified,
        this.thumbnail,
        this.resourceUri,
        this.comics,
        this.series,
        this.stories,
        this.events,
        this.urls,
    });

    factory Heros.fromJson(String str) => Heros.fromMap(json.decode(str));

    factory Heros.fromMap(Map<String, dynamic> json) => Heros(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromMap(json["comics"]),
        series: Comics.fromMap(json["series"]),
        stories: Stories.fromMap(json["stories"]),
        events: Comics.fromMap(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
    );

}