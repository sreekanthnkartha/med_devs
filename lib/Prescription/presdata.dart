import 'dart:convert';

class PresModel {
    String name;
    String type;
    String description;
    String image;
    bool abc;

    PresModel({
        required this.name,
        required this.type,
        required this.description,
        required this.image,
        required this.abc,
    });

    PresModel copyWith({
        required String name,
        required String type,
        required String description,
        required String image,
    }) => 
        PresModel(
            name: name,
            type: type,
            description: description,
            image: image,
            abc: abc,
        );

    factory PresModel.fromRawJson(String str) => PresModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PresModel.fromJson(Map<String, dynamic> json) => PresModel(
        name: json["name"],
        type: json["type"],
        description: json["description"],
        image: json["image"],
        abc: json["abc"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "image": image,
        "abc": abc,
    };
}