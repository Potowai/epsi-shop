import 'dart:ffi';

class Articles {
  int id;
  String nom;
  String description;
  String image;
  double prix;
  String categorie;
  double rating;
  int countRating;
  int quantity = 1;

  Articles(
      {required this.id,
      required this.nom,
      required this.description,
      required this.image,
      required this.prix,
      required this.categorie,
      required this.rating,
      required this.countRating});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
        id: json['id'].toInt(),
        nom: json['title'],
        description: json['description'],
        image: json['image'],
        prix: double.parse(json['price'].toString()),
        categorie: json['category'],
        rating: double.parse(json['rating']['rate'].toString()),
        countRating: json['rating']['count']);
  }
}
