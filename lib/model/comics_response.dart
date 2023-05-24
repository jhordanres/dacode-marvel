// To parse this JSON data, do
//
//     final comicsResponse = comicsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:daco_marvel/model/models.dart';

class ComicsResponse {
    int? code;
    String? status;
    String? copyright;
    String? attributionText;
    String? attributionHtml;
    String? etag;
    Data? data;

    ComicsResponse({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.etag,
        this.data,
    });

    factory ComicsResponse.fromJson(String str) => ComicsResponse.fromMap(json.decode(str));

    factory ComicsResponse.fromMap(Map<String, dynamic> json) => ComicsResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromMap(json["data"]),
    );
}

class Data {
    int? offset;
    int? limit;
    int? total;
    int? count;
    List<Comic>? results;

    Data({
        this.offset,
        this.limit,
        this.total,
        this.count,
        this.results,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Comic>.from(json["results"].map((x) => Comic.fromMap(x))),
    );
}

class Characters {
    int? available;
    String? collectionUri;
    List<Series>? items;
    int? returned;

    Characters({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

    factory Characters.fromJson(String str) => Characters.fromMap(json.decode(str));

    factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromMap(x))),
        returned: json["returned"],
    );
}

class Series {
    String? resourceUri;
    String? name;

    Series({
        this.resourceUri,
        this.name,
    });

    factory Series.fromJson(String str) => Series.fromMap(json.decode(str));

    factory Series.fromMap(Map<String, dynamic> json) => Series(
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
        items: List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromMap(x))),
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

    factory CreatorsItem.fromJson(String str) => CreatorsItem.fromMap(json.decode(str));

    factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
    );
}


class Date {
    String? type;
    String? date;

    Date({
        this.type,
        this.date,
    });

    factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

    factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: json["type"],
        date: json["date"],
    );
}




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


class Price {
    String? type;
    double? price;

    Price({
        this.type,
        this.price,
    });

    factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

    factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: json["type"],
        price: json["price"].toDouble(),
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
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
    );
}

class StoriesItem {
    String? resourceUri;
    String? name;
    String? type;

    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

    factory StoriesItem.fromJson(String str) => StoriesItem.fromMap(json.decode(str));

    factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
    );

}


class TextObject {
    String? type;
    String? language;
    String? text;

    TextObject({
        this.type,
        this.language,
        this.text,
    });

    factory TextObject.fromJson(String str) => TextObject.fromMap(json.decode(str));

    factory TextObject.fromMap(Map<String, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
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

