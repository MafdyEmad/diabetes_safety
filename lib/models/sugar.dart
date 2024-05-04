class Sugar {
  final int? id;
  final int body;
  final int meal;
  final DateTime? added;

  Sugar({this.id, required this.body, required this.meal, this.added});
  factory Sugar.fromJson(Map<String, dynamic> jsonData) {
    return Sugar(
        id: jsonData['id'],
        body: jsonData['body'],
        added: DateTime.parse(
          jsonData['added'],
        ),
        meal: jsonData['meal']);
  }
  Map<String, dynamic> toJson() {
    return {
      "meal": meal.toString(),
      "body": body.toString(),
    };
  }
}
