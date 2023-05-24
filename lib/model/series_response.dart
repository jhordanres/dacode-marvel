// To parse this JSON data, do
//
//     final seriesResponse = seriesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:daco_marvel/model/series.dart';

class SeriesResponse {
  SeriesResponse({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  Data? data;

  factory SeriesResponse.fromJson(String str) =>
      SeriesResponse.fromMap(json.decode(str));

  factory SeriesResponse.fromMap(Map<String, dynamic> json) {
    return SeriesResponse(
      code: json["code"],
      status: json["status"],
      copyright: json["copyright"],
      attributionText: json["attributionText"],
      attributionHtml: json["attributionHTML"],
      etag: json["etag"],
      data: json["data"] != null ? Data.fromMap(json["data"]) : null,
    );
  }
}

class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Seriee>? results;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) {
    return Data(
      offset: json["offset"],
      limit: json["limit"],
      total: json["total"],
      count: json["count"],
      results: List<Seriee>.from(json["results"]?.map((x) => Seriee.fromMap(x)) ?? []),
    );
  }
}

class Characters {
  int? available;
  String? collectionUri;
  List<Next>? items;
  int? returned;

  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Characters.fromJson(String str) =>
      Characters.fromMap(json.decode(str));

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Next>.from(json["items"].map((x) => Next.fromMap(x))),
        returned: json["returned"],
      );
}

class Next {
  String? resourceUri;
  String? name;

  Next({
    this.resourceUri,
    this.name,
  });

  factory Next.fromJson(String str) => Next.fromMap(json.decode(str));

  factory Next.fromMap(Map<String, dynamic> json) => Next(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );
}

class Creators {
  int? available;
  String? collectionUri;
  List<CreatorsItem>? items;
  int? returned;

  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Creators.fromJson(String str) => Creators.fromMap(json.decode(str));

  factory Creators.fromMap(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<CreatorsItem>.from(
            json["items"].map((x) => CreatorsItem.fromMap(x))),
        returned: json["returned"],
      );
}

class CreatorsItem {
  String? resourceUri;
  String? name;
  String? role;

  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  factory CreatorsItem.fromJson(String str) =>
      CreatorsItem.fromMap(json.decode(str));

  factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );
}

class Stories {
  int? available;
  String? collectionUri;
  List<StoriesItem>? items;
  int? returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(
            json["items"].map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
      );
}

class StoriesItem {
  String? resourceUri;
  String? name;
  Type? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(String str) =>
      StoriesItem.fromMap(json.decode(str));

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: typeValues.map[json["type"]],
      );
}

enum Type { COVER, INTERIOR_STORY, EMPTY }

final typeValues = EnumValues({
  "cover": Type.COVER,
  "": Type.EMPTY,
  "interiorStory": Type.INTERIOR_STORY
});

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );
}

class Url {
  String? type;
  String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
