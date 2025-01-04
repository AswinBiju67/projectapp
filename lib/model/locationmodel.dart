class ModelClass {
  final String placeId;
  final String description;

  ModelClass({required this.placeId, required this.description});

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    return ModelClass(
      placeId: json['place_id'],
      description: json['description'],
    );
  }
}
