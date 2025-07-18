import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:pratica/core/constants/db_contants.dart';
import 'package:pratica/data/datasource/local/app_database.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabaseImpl implements AppDatabase {
  static AppDatabaseImpl? _instance;

  static Future<AppDatabaseImpl> initialize() async {
    return _instance ??= AppDatabaseImpl._(await _initialize());
  }

  AppDatabaseImpl._(Database database) : db = database;

  @override
  Database db;

  @override
  Future<String> getDbPath() async => await getDatabasesPath();

  static Future<Database> _initialize() async {
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, DbConstants.dbName);

    var db = await openDatabase(
      path,
      version: DbConstants.version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onConfigure: _onConfigure,
      onDowngrade: onDatabaseDowngradeDelete,
    );
    return db;
  }

  static void _onCreate(Database db, int newVersion) async {
    String s = await rootBundle.loadString(DbConstants.create);

    List<String> sqls = s.split(';');

    for (String sql in sqls) {
      if (sql.trim().isNotEmpty) {
        await db.execute(sql);
      }
    }
  }

  static FutureOr<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future<FutureOr<void>> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    /// Verifica a versão atual e nova versão do banco de dados
    if (oldVersion < DbConstants.version) {
      /// Pega a partir da versão atual
      for (int i = oldVersion + 1; i <= DbConstants.version; i++) {
        try {
          /// Abre o arquivo
          String s = await rootBundle
              .loadString('${DbConstants.pathUpgrade}$i.sql');

          List<String> sqls = s.split(";");

          for (String sql in sqls) {
            if (sql.trim().isNotEmpty) {
              try {
                /// Executa a instrução  SQL
                await db.execute(sql);
              } catch (e) {
                if (kDebugMode) {
                  print(e);
                }
                continue;
              }
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          continue;
        }
      }
    }
  }
}