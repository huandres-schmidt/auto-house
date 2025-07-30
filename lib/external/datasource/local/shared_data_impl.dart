import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/enum/preferences.dart';
import '../../../data/datasource/local/shared_data.dart';

class SharedDataImpl extends SharedData {
  static SharedDataImpl? _instance;

  static Future<SharedDataImpl> initialize() async =>
      _instance ??= SharedDataImpl._(await _initialize());

  SharedDataImpl._(this._prefs);

  static Future<SharedPreferences> _initialize() async =>
      await SharedPreferences.getInstance();

  final SharedPreferences _prefs;

  final List<Type> _allowTypes = [String, List<String>, int, double, bool];

  @override
  Future<void> cleanValue(Preferences preference) {
    return _prefs.remove(preference.key);
  }

  @override
  Future<void> clearValues() {
    return _prefs.clear();
  }

  @override
  T? getValue<T>(Preferences preference) {
    assert(
      _allowTypes.contains(T),
      'Type fornecido não permitido: $T, '
      'você deve providenciar um dos seguintes Types: $_allowTypes',
    );

    try {
      return _prefs.get(preference.key) as T?;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setValue<T>(Preferences preference, T value) {
    assert(
      _allowTypes.contains(value.runtimeType),
      'Type fornecido não permitido: ${value.runtimeType}, '
      'você deve providenciar um dos seguintes Types: $_allowTypes',
    );

    if (value is String) {
      return _prefs.setString(preference.key, value);
    }
    if (value is List<String>) {
      return _prefs.setStringList(preference.key, value);
    }
    if (value is bool) {
      return _prefs.setBool(preference.key, value);
    }
    if (value is int) {
      return _prefs.setInt(preference.key, value);
    }
    if (value is double) {
      return _prefs.setDouble(preference.key, value);
    }

    throw Exception('Tipo de valor não suportado: ${value.runtimeType}');
  }
}