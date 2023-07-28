import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    path = join(path, 'notes.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notebook (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        color INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        notebookId INTEGER, -- Foreign key linking the note to the notebook
        title TEXT,
        body TEXT,
        color INTEGER
      )
    ''');

    await db.execute('''
    CREATE TABLE timetable(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    subject TEXT,
    date TEXT,
    startTime TEXT,
    endTime TEXT,
    repeating TEXT,
    color INTEGER
    )
   
    ''');

  }

  Future<int> insertNote(Notes note) async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.insert('notes', note.toJson());
    });
  }

  Future<void> insertTimeTable(TimeTable instance) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.insert('timetable', instance.toMap());
    });
  }


  // Get events by date
  Future<List<TimeTable>> getEventsByDate(DateTime date) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'timetable',
      where: 'date = ?',
      whereArgs: [date.toIso8601String()],
    );

    return List.generate(maps.length, (i) {
      return TimeTable.fromMap(maps[i]);
    });
  }

  Future<void> deleteNote(int noteId) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [noteId],
      );
    });
  }


  Future<void> updateNote(Notes note) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.update(
        'notes',
        {
          'title': note.title,
          'body': note.body,
          'color': note.color,
        },
        where: 'id = ?',
        whereArgs: [note.noteId],
      );
    });
  }

  Future<void> deleteNotebook(int id) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('notebook', where: 'id = ?', whereArgs: [id]);
      await txn.delete('notes', where: 'notebookId = ?', whereArgs: [id]);
    });
  }


  Future<int> insertNotebook(Notebook notebook) async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.insert('notebook', notebook.toJson());
    });
  }


  Future<List<Notebook>> getAllNotebooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notebook');
    return List.generate(maps.length, (index) {
      return Notebook.fromJson(maps[index]);
    });
  }

  Future<List<Notes>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (index) {
      return Notes(
        notebookId: maps[index]['notebookId'], // Add the notebookId field
        title: maps[index]['title'],
        body: maps[index]['body'],
        color: maps[index]['color'], noteId: maps[index]['id'],
      );
    });
  }

  Future<List<TimeTable>> getTimetable() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('timetable');
    return List.generate(maps.length, (index) {
      return TimeTable(
        id: maps[index]['id'],
        date: maps[index]['date'],
        startTime: maps[index]['startTime'],
        endTime: maps[index]['endTime'],
        repeating: maps[index]['repeating'],
        color: maps[index]['color'],
        subject: maps[index]['subject'],
      );
    });
  }





  Future<List<Notes>> getNotesbyId(int notebookId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
        'notes', where: 'notebookId = ?', whereArgs: [notebookId]);
    return List.generate(maps.length, (index) {
      return Notes(

        notebookId: maps[index]['notebookId'],
        // Add the notebookId field
        title: maps[index]['title'],
        body: maps[index]['body'],
        color: maps[index]['color'],
        noteId: maps[index]['id'],
      );
    });
  }

  Future<List<Notebook>> getAllNoteBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notebook');
    return List.generate(maps.length, (index) {
      return Notebook(

        id: maps[index]['id'],
        // Add the notebookId field
        name: maps[index]['title'],

        color: maps[index]['color'],
      );
    });
  }


// Add other CRUD methods as needed.
}

class Notes {
  int? noteId;
  int notebookId; // Identifier for the Notebook this note belongs to
  String title;
  String body;
  int? color;

  Notes({
    required this.noteId,
    required this.notebookId,
    required this.title,
    required this.body,
    required this.color,
  });

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
    noteId: json["id"],
    notebookId: json["notebookId"],
    title: json["title"],
    body: json["body"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {

    "notebookId": notebookId,
    "title": title,
    "body": body,
    "color": color,
  };
}

class Notebook {
  int? id;
  String name;
  int? color;


  Notebook({
    required this.id,
    required this.name,
    required this.color,

  }); // Initialize the notes list with an empty list if notes is null



  factory Notebook.fromJson(Map<String, dynamic> json) => Notebook(
    id: json["id"],
    name: json["title"],
    color: json["color"],

  );



  Map<String, dynamic> toJson() => {
    "id":id,
    "title": name,
    "color": color,
  };
}



class TimeTable {
  final int? id;
  final String subject;
  final String date;
  final String startTime; // Store time as minutes since midnight
  final String endTime; // Store time as minutes since midnight
  final String repeating;
  final int color;

  TimeTable({
    this.id,
    required this.subject,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.repeating,
    required this.color,
  });

  // Convert TimeTable object to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'repeating': repeating,
      'color': color,
    };
  }

  // Create a TimeTable object from Map retrieved from the database
  static TimeTable fromMap(Map<String, dynamic> map) {
    return TimeTable(
      id: map['id'],
      date: map['date'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      repeating: map['repeating'],
      color: map['color'],
      subject: map['subject'],
    );
  }
}



