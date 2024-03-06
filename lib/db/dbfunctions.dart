import 'package:expense_tracker/db/model.dart';

import 'package:sqflite/sqflite.dart';

late Database db;
List<Entry> entries = [];

//Initialize database ,create table..........
Future<void> initDatabase() async {
  db = await openDatabase('expensetracker.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE expense (id INTEGER PRIMARY KEY, income REAL, expense REAL, timestamp NUMERIC)');
  });
}

//Insert function.......................
inserData(Entry values) {
  db.rawInsert('INSERT INTO expense (income,expense,timestamp) VALUES (?,?,?)',
      [values.income, values.expense, values.dateTime.toIso8601String()]);
}

//Delete function.....................
Future<void> deleteData(id) async {
  await db.rawDelete('DELETE FROM expense WHERE id = ?', [id]);
}
