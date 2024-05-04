class Reminder {
  final String name;
  final int? id;
  final int type;
  final DateTime date;

  Reminder({
    required this.name,
    required this.type,
    required this.date,
    this.id,
  });
  factory Reminder.fromJson(Map<String, dynamic> jsonData) {
    return Reminder(
        name: jsonData['name'],
        type: jsonData['type'],
        date: DateTime.parse(
          jsonData['date'],
        ),
        id: jsonData['id']);
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type.toString(),
      "date": date.toString(),
    };
  }
}
