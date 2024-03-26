class NameModel {
  final String name;
  final int frequency;
  final int rank;

  NameModel({
    required this.name,
    required this.frequency,
    required this.rank,
  });

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      name: json['nome'],
      frequency: json['freq'],
      rank: json['rank'],
    );
  }
}
