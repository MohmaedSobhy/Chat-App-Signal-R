class ReciverModel {
  final String name;
  final String id;

  ReciverModel({
    required this.name,
    required this.id,
  });

  factory ReciverModel.fromJson(Map<String, dynamic> json) {
    return ReciverModel(
      name: json['name'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}
