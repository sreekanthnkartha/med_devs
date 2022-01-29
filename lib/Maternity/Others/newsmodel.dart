import 'dart:convert';

class NewsModel {
    String name;
    String type;
    String description;
    String image;

    NewsModel({
        required this.name,
        required this.type,
        required this.description,
        required this.image,
    });

    NewsModel copyWith({
        required String name,
        required String type,
        required String description,
        required String image,
    }) => 
        NewsModel(
            name: name,
            type: type,
            description: description,
            image: image,
        );

    factory NewsModel.fromRawJson(String str) => NewsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        name: json["name"],
        type: json["type"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "image": image,
    };
}