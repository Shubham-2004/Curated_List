import 'dart:convert';

// Function to parse JSON data into CuratedList model
CuratedList curatedListFromJson(String str) =>
    CuratedList.fromJson(json.decode(str));

// Function to convert CuratedList model to JSON string
String curatedListToJson(CuratedList data) => json.encode(data.toJson());

// Model for CuratedList
class CuratedList {
  final int? error;
  final String? message;
  final List<Datum>? data;

  CuratedList({
    this.error,
    this.message,
    this.data,
  });

  factory CuratedList.fromJson(Map<String, dynamic> json) => CuratedList(
        error: json["error"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

// Model for Datum
class Datum {
  final String? id;
  final String? title;
  final String? userId;
  final DateTime? createdOn;
  final String? slug;
  final String? active;
  final String? autofetch;
  final String? followersCount;
  final String? eventsCount;
  final String? organizersCount;
  final String? listTitle;
  final String? listKeywords;
  final String? listDescription;
  final dynamic h1Text;
  final dynamic h2Text;
  final dynamic pageDescription;
  final String? params;
  final dynamic htmlContent;
  final String? firstName;
  final String? lastName;
  final String? avatar;
  final String? isInList;
  final String? isFollowing;
  final String? url;

  Datum({
    this.id,
    this.title,
    this.userId,
    this.createdOn,
    this.slug,
    this.active,
    this.autofetch,
    this.followersCount,
    this.eventsCount,
    this.organizersCount,
    this.listTitle,
    this.listKeywords,
    this.listDescription,
    this.h1Text,
    this.h2Text,
    this.pageDescription,
    this.params,
    this.htmlContent,
    this.firstName,
    this.lastName,
    this.avatar,
    this.isInList,
    this.isFollowing,
    this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        userId: json["user_id"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        slug: json["slug"],
        active: json["active"],
        autofetch: json["autofetch"],
        followersCount: json["followers_count"],
        eventsCount: json["events_count"],
        organizersCount: json["organizers_count"],
        listTitle: json["list_title"],
        listKeywords: json["list_keywords"],
        listDescription: json["list_description"],
        h1Text: json["h1_text"],
        h2Text: json["h2_text"],
        pageDescription: json["page_description"],
        params: json["params"],
        htmlContent: json["html_content"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        isInList: json["is_in_list"],
        isFollowing: json["is_following"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "user_id": userId,
        "created_on": createdOn?.toIso8601String(),
        "slug": slug,
        "active": active,
        "autofetch": autofetch,
        "followers_count": followersCount,
        "events_count": eventsCount,
        "organizers_count": organizersCount,
        "list_title": listTitle,
        "list_keywords": listKeywords,
        "list_description": listDescription,
        "h1_text": h1Text,
        "h2_text": h2Text,
        "page_description": pageDescription,
        "params": params,
        "html_content": htmlContent,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "is_in_list": isInList,
        "is_following": isFollowing,
        "url": url,
      };
}
