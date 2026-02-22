class Dependent {
  final String id;
  final String name;
  final String relation;

  Dependent({
    required this.id,
    required this.name,
    required this.relation,
  });

  factory Dependent.fromJson(Map<String, dynamic> json) {
    return Dependent(
      id: json['id'] as String,
      name: json['name'] as String,
      relation: json['relation'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'relation': relation,
    };
  }
}
