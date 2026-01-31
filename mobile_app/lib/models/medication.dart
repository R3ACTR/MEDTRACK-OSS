class Medication {
  final String id;
  final String name;
  final String dosage;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
    };
  }
}
