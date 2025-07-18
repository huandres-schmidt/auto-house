import 'package:pratica/core/resources/base_model.dart';
import 'package:pratica/data/datasource/local/app_database.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseLocalDataSource<T extends BaseModel> {
  final AppDatabase _appDatabase;
  final String _tableName;
  final Function _fromMap;

  BaseLocalDataSource(this._appDatabase, this._tableName, this._fromMap);

  Future<int> insert(T model) async {
    return await _appDatabase.db.insert(
      _tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> delete({String? where, List<Object?>? whereArgs}) async {
    return await _appDatabase.db.delete(
      _tableName,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<List<T?>> findAll() async {
    return await _appDatabase.db
        .query(_tableName)
        .then((value) => value.map<T>((e) => _fromMap(e)).toList());
  }

  Future<int> update(int id, valor, String coluna, String where) async {
    return await _appDatabase.db.rawUpdate(
      """
      UPDATE $_tableName
      SET $coluna = $valor
      WHERE $where
      """
    );
  }
}
