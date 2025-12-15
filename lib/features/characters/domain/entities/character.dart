class Character {
  final int id;
  final String name;
  final String species;
  final String image;
  final String origin;
  final String location;
  final List<String> episodes;

  const Character({
    required this.id,
    required this.name,
    required this.species,
    required this.image,
    required this.origin,
    required this.location,
    required this.episodes,
  });
}
