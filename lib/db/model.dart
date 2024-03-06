
//Data model class....................
class Entry {
  int? id;
  final double income;
  final double expense;
  final DateTime dateTime;
  Entry({
    required this.income,
    required this.expense,
    required this.dateTime,
    this.id,
  });

  static Entry fromMap(Map<String, Object?> map) {
    final id = map["id"] as int?;
    final income = (map['income'] as num?)?.toDouble() ?? 0.0;
    final expense = (map['expense'] as num?)?.toDouble() ?? 0.0;
    final timestamp = map['timestamp'];
    final datetime = timestamp is DateTime
        ? timestamp
        : DateTime.parse(timestamp.toString());

    return Entry(id: id, income: income, expense: expense, dateTime: datetime);
  }
}
