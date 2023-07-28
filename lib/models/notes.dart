import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;



class NotesDatabaseHelper{


  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
    CREATE TABLE NOTES(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    body TEXT,
    color INT
      """);
  }


  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'notes.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item
  static Future<int> createItem(String? title, String? descrption, int? color) async {
    final db = await NotesDatabaseHelper.db();

    final data = {'title': title,
      'body': descrption,
      'color': color };
    final id = await db.insert('notes', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await NotesDatabaseHelper.db();
    return db.query('notes', orderBy: "id");
  }


  // Get a single item by id
  //We dont use this method, it is for you if you want it.
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await NotesDatabaseHelper.db();
    return db.query('notes', where: "id = ?", whereArgs: [id], limit: 1);
  }


  // Update an item by id
  static Future<int> updateItem(
      int id, String title, String? descrption, int color) async {
    final db = await NotesDatabaseHelper.db();

    final data = {
      'title': title,
      'body': descrption,
      'color': color,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await NotesDatabaseHelper.db();
    try {
      await db.delete("notes", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

}