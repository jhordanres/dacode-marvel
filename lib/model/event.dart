import 'dart:convert';

import 'package:daco_marvel/model/models.dart';

class Event {
  int? id;
  String? title;
  String? description;
  String? resourceUri;
  List<Url>? urls;
  String? modified;
  DateTime? start;
  DateTime? end;
  Thumbnail? thumbnail;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? comics;
  Characters? series;
  Next? next;
  Next? previous;

  get fullPoster {
    return '${thumbnail!.path! +'.'+thumbnail!.extension!}';
  }

  Event({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.series,
    this.next,
    this.previous,
  });

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        modified: json["modified"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        creators: Creators.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
        stories: Stories.fromMap(json["stories"]),
        comics: Characters.fromMap(json["comics"]),
        series: Characters.fromMap(json["series"]),
        next: Next.fromMap(json["next"]),
        previous: Next.fromMap(json["previous"]),
      );
}
