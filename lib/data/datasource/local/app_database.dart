import 'package:sqflite/sqflite.dart';

abstract class AppDatabase {
  late final Database db;

  Future<String> getDbPath();
}