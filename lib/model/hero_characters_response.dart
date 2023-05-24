
// To parse this JSON data, do
//
//     final heroCharactersResponse = heroCharactersResponseFromMap(jsonString);

import 'dart:convert';

import 'models.dart';



class HeroCharactersResponse {
    int? code;
    String? status;
    String? copyright;
    String? attributionText;
    String? attributionHtml;
    String? etag;
    Data? data;

    HeroCharactersResponse({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.etag,
        this.data,
    });

    factory HeroCharactersResponse.fromJson(String str) => HeroCharactersResponse.fromMap(json.decode(str));

    factory HeroCharactersResponse.fromMap(Map<String, dynamic> json) => HeroCharactersResponse(
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
    List<Heros>? results;

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
        results: List<Heros>.from(json["results"].map((x) => Heros.fromMap(x))),
    );

}



class Comics {
    int? available;
    String? collectionUri;
    List<ComicsItem>? items;
    int? returned;

    Comics({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

    factory Comics.fromJson(String str) => Comics.fromMap(json.decode(str));

    factory Comics.fromMap(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(json["items"].map((x) => ComicsItem.fromMap(x))),
        returned: json["returned"],
    );
}

class ComicsItem {
    String? resourceUri;
    String? name;

    ComicsItem({
        this.resourceUri,
        this.name,
    });

    factory ComicsItem.fromJson(String str) => ComicsItem.fromMap(json.decode(str));

    factory ComicsItem.fromMap(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
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


