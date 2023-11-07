class Media {
  int id;
  String image;
  String alt;
  DateTime createdAt;

  Media({
    required this.id,
    required this.image,
    required this.alt,
    required this.createdAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    image: json["image"],
    alt: json["alt"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "alt": alt,
    "created_at": createdAt.toIso8601String(),
  };
}