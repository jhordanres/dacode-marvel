// To parse this JSON data, do
//
//     final storiesResponse = storiesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:daco_marvel/model/stories.dart';

class StoriesResponse {
    int? code;
    String? status;
    String? copyright;
    String? attributionText;
    String? attributionHtml;
    String? etag;
    Data? data;

    StoriesResponse({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.etag,
        this.data,
    });

    factory StoriesResponse.fromJson(String str) => StoriesResponse.fromMap(json.decode(str));

    factory StoriesResponse.fromMap(Map<String, dynamic> json) => StoriesResponse(
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
    List<Storie>? results;

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
        results: List<Storie>.from(json["results"].map((x) => Storie.fromMap(x))),
    );
}


class Characters {
    int? available;
    String? collectionUri;
    List<OriginalIssue>? items;
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
        items: List<OriginalIssue>.from(json["items"].map((x) => OriginalIssue.fromMap(x))),
        returned: json["returned"],
    );
}

class OriginalIssue {
    String? resourceUri;
    String? name;

    OriginalIssue({
        this.resourceUri,
        this.name,
    });

    factory OriginalIssue.fromJson(String str) => OriginalIssue.fromMap(json.decode(str));

    factory OriginalIssue.fromMap(Map<String, dynamic> json) => OriginalIssue(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );
}

class Creators {
    int? available;
    String? collectionUri;
    List<Item>? items;
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
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        returned: json["returned"],
    );
}

class Item {
    String? resourceUri;
    String? name;
    String? role;

    Item({
        this.resourceUri,
        this.name,
        this.role,
    });

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
    );
}



