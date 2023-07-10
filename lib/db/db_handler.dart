import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:trendy_movies_app/models/movie_list.dart';

class DbHandler{

  static Database? _db;

  Future<Database?> getDB() async{
    if(_db != null){
      return _db;
    }
    else{
      _db = await initialiseDB();
      return _db;
    }
  }

  initialiseDB() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,"movies_list.db");
    var db = await openDatabase(path , version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database database,int version) async{
    await database.execute('CREATE TABLE movies_list (id INTEGER PRIMARY KEY,title TEXT NOT NULL,overview TEXT NOT NULL,posterPath TEXT NOT NULL)');
  }

  Future<Result> insert(Result result) async{
    var dbClient = await getDB();
    await dbClient?.insert('movies_list', result.toJson());
    return result;
  }
}