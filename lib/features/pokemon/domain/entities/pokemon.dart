import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int? id;
  final String? name;
  final String? url;

  const Pokemon({
    required this.id,
    required this.name,
    required this.url,
  });
  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  @override
  List<Object?> get props => [id, name, url];
}
