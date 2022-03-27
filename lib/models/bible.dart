class Bible {
  final String id;
  final String name;
  final String abbrev;
  final String description;

  Bible({
    required this.id,
    required this.name,
    required this.abbrev,
    required this.description,
  });

  Bible.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['nameLocal'],
        abbrev = json['abbreviationLocal'],
        description = json['descriptionLocal'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}
