import 'package:expense_tracker/db/model.dart';

import 'package:sqflite/sqflite.dart';

late Database db;
List<Entry> entries = [];
List<User> users =
    []; // Renamed from "user" to "users" to avoid potential conflicts with table name

// Initialize database, create tables, etc.
Future<void> initDatabase() async {
  db = await openDatabase('expensetracker.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE expense (id INTEGER PRIMARY KEY, income REAL, expense REAL, timestamp NUMERIC)');
    await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT, phone INTEGER, photo1 TEXT, photo2 TEXT, photo3 TEXT)');
  });
}

Future<void> fetchUsersFromDatabase() async {
  final List<Map<String, dynamic>> dataList =
      await db.rawQuery('SELECT * FROM user');

  // Clear the existing list to prevent duplicates
  users.clear();

  // Convert each row into a User object and add it to the users list
  for (var data in dataList) {
    users.add(User(
      id: data['id'],
      name: data['name'],
      phone: data['phone'],
      img1: data['photo1'],
      img2: data['photo2'],
      img3: data['photo3'],
    ));
    print(users.length);
     print(users[0].name);
     print(users[0].phone);
     print(users[0].img1);
     print(users[0].img2);
    print(users[0].img3);
  }
}

//Insert function.......................
inserData(Entry values) {
  db.rawInsert('INSERT INTO expense (income,expense,timestamp) VALUES (?,?,?)',
      [values.income, values.expense, values.dateTime.toIso8601String()]);
}

//Insert function.......................
insertData(
  User user,
) async {
  db.rawInsert(
      'INSERT INTO user (name,phone,photo1,photo2,photo3) VALUES (?,?,?,?,?)',
      [user.name, user.phone, user.img1, user.img2, user.img3]);
  users.add(user);
  print(user);
}

//Delete function.....................
Future<void> deleteData(id) async {
  await db.rawDelete('DELETE FROM expense WHERE id = ?', [id]);
}
