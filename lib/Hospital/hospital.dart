import 'dart:convert';

class HosModel {
    String name;
    String type;
    String description;
    String image;

    HosModel({
        required this.name,
        required this.type,
        required this.description,
        required this.image,
    });

    HosModel copyWith({
        required String name,
        required String type,
        required String description,
        required String image,
    }) => 
        HosModel(
            name: name,
            type: type,
            description: description,
            image: image,
        );

    factory HosModel.fromRawJson(String str) => HosModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HosModel.fromJson(Map<String, dynamic> json) => HosModel(
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