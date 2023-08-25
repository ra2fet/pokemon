import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.url,
  });

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    // I have used the url to get the id from the link
    final url = json['url'] as String;
    return PokemonModel(
      id: int.parse(url.split('/')[6]),
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'image': imageUrl,
    };
  }
}
