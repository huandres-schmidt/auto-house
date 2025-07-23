import '../../../core/enum/preferences.dart';

abstract class SharedData {
  Future<void> clearValues();

  T? getValue<T>(Preferences preference);

  Future<void> setValue<T>(Preferences preference, T value);

  Future<void> cleanValue(Preferences preference);
}