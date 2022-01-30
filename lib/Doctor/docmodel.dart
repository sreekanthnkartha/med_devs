import 'dart:convert';

class DoctorModel {
    String name;
    String type;
    String description;
    double goodReviews;
    double totalScore;
    double satisfaction;
    String image;

    DoctorModel({
        required this.name,
        required this.type,
        required this.description,
        required this.goodReviews,
        required this.totalScore,
        required this.satisfaction,
        required this.image,
    });

    DoctorModel copyWith({
        required String name,
        required String type,
        required String description,
        required double goodReviews,
        required double totalScore,
        required double satisfaction,
        required String image,
    }) => 
        DoctorModel(
            name: name,
            type: type,
            description: description,
            goodReviews: goodReviews,
            totalScore: totalScore,
            satisfaction: satisfaction,
            image: image,
        );

    factory DoctorModel.fromRawJson(String str) => DoctorModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        name: json["name"],
        type: json["type"],
        description: json["description"],
        goodReviews: json["goodReviews"] == null ? null : json["goodReviews"].toDouble(),
        totalScore: json["totalScore"] == null ? null : json["totalScore"].toDouble(),
        satisfaction: json["satisfaction"] == null ? null : json["satisfaction"].toDouble(),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "description": description,
        "goodReviews": goodReviews,
        "totalScore": totalScore,
        "satisfaction": satisfaction,
        "image": image,
    };
}