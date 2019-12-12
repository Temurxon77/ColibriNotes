import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database db;

class DataBaseCreator {
  static const todoTable = 'todo';
  static const id = 'id';
  static const name = 'name';
  static const info = 'info';
  static const isDeleted = 'isDeleted';


  static void dataBaseLog(String functionName,String sql,
    [List<Map<String,dynamic>> selectQueryResult,int insertAndUpdateQueryResult]){
      print(functionName);
      print(sql);
      if(selectQueryResult != null ){
        print(selectQueryResult);
      }else if(insertAndUpdateQueryResult != null){
        print(insertAndUpdateQueryResult);
      }
  }
  Future<void> createTodoTable(Database db) async {
    final todoSql = '''CREATE TABLE $todoTable
    (
       $id INTEGER PRIMARY KEY,
       $name TEXT,
       $info TEXT,
       $isDeleted BIT NOT NULL
    )''';
  await db.execute(todoSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath,dbName);
    if(await Directory(dirname(path)).exists()){

    }else{
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }
  Future<void> initDatabase() async {
    final path = await getDatabasePath('todo_db');
    db = await openDatabase(path,version: 1,onCreate: onCreate);
  }

  Future<void> onCreate(Database db,int version) async {

  }
}

