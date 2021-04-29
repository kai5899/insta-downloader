import 'dart:io';
import 'package:instagram_media_downloader/Models/InstaUserModel.dart';
import 'package:instagram_media_downloader/Models/PostModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "instadownloady.db";

  static final _databaseVersion = 1;
  //singlton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //sinle wide app refrence to the database;
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onConfigure: _onConfigure);
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE instaUsers (
          id TEXT PRIMARY KEY,
          username TEXT NOT NULL,
          profile_pic_url TEXT NOT NULL,
          full_name TEXT NOT NULL
        )
    ''');
    await db.execute('''
        CREATE TABLE posts (
          id TEXT PRIMARY KEY,
          shortcode TEXT NOT NULL,
          is_video INTEGER NOT NULL,
          displayUrl TEXT NOT NULL,
          videoUrl TEXT NOT NULL,
          caption TEXT NOT NULL,
          ownerId TEXT NOT NULL,
          FOREIGN KEY (ownerId) REFERENCES instaUsers (id)
        )
    ''');
  }

  //inserts

  Future<int> insertUser(InstaUserModel user) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.insert("instaUsers", user.toJson());
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<int> insertPost(PostModel post) async {
    Database db = await instance.database;
    // int id;
    // try {
    //   id = ;
    // } catch (e) {
    //   id = -1;
    //   print(e.toString());
    // }

    return await db.insert("posts", post.toJson());
  }

  //get all

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    Database db = await instance.database;
    return await db.query("instaUsers");
  }

  Future<List<Map<String, dynamic>>> getAllPosts() async {
    Database db = await instance.database;
    return await db.query("posts");
  }

  //deletes

  Future<int> deleteUser(InstaUserModel user) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.delete("instaUsers", where: "id = ?", whereArgs: [user.id]);
    } catch (e) {
      id = -1;
    }
    return id;
  }

  Future<int> deletePost(PostModel post) async {
    Database db = await instance.database;
    int id;
    try {
      id = await db.delete("posts", where: "id = ?", whereArgs: [post.id]);
    } catch (e) {
      print(e);
      id = -1;
    }
    return id;
  }
}
