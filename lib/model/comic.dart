import 'dart:convert';

import 'package:daco_marvel/model/comics_response.dart';

class Comic {
    int? id;
    int? digitalId;
    String? title;
    int? issueNumber;
    String? variantDescription;
    String? description;
    String? modified;
    String? isbn;
    String? upc;
    String? diamondCode;
    String? ean;
    String? issn;
    String? format;
    int? pageCount;
    List<TextObject>? textObjects;
    String? resourceUri;
    List<Url>? urls;
    Series? series;
    List<Series>? variants;
    List<dynamic>? collections;
    List<dynamic>? collectedIssues;
    List<Date>? dates;
    List<Price>? prices;
    Thumbnail? thumbnail;
    List<Thumbnail>? images;
    Creators? creators;
    Characters? characters;
    Stories? stories;
    Characters? events;

    get fullPoster {
      if(this.thumbnail !=null){
        return '${thumbnail!.path! +'.'+thumbnail!.extension!}';
      }else{
        return 'https://i.stack.imgur.com/GNHx0.png';
      }
  }

    Comic({
        this.id,
        this.digitalId,
        this.title,
        this.issueNumber,
        this.variantDescription,
        this.description,
        this.modified,
        this.isbn,
        this.upc,
        this.diamondCode,
        this.ean,
        this.issn,
        this.format,
        this.pageCount,
        this.textObjects,
        this.resourceUri,
        this.urls,
        this.series,
        this.variants,
        this.collections,
        this.collectedIssues,
        this.dates,
        this.prices,
        this.thumbnail,
        this.images,
        this.creators,
        this.characters,
        this.stories,
        this.events,
    });

    factory Comic.fromJson(String str) => Comic.fromMap(json.decode(str));

    factory Comic.fromMap(Map<String, dynamic> json) => Comic(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        format: json["format"],
        pageCount: json["pageCount"],
        textObjects: List<TextObject>.from(json["textObjects"].map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        series: Series.fromMap(json["series"]),
        variants: List<Series>.from(json["variants"].map((x) => Series.fromMap(x))),
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues: List<dynamic>.from(json["collectedIssues"].map((x) => x)),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        images: List<Thumbnail>.from(json["images"].map((x) => Thumbnail.fromMap(x))),
        creators: Creators.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
        stories: Stories.fromMap(json["stories"]),
        events: Characters.fromMap(json["events"]),
    );
}