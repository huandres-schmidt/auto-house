abstract class PreferencesLocalRepository {
  Future<void> setNome(String name);
  String? getNome();

  Future<void> setUsuarioLogado(bool isLogado);
  bool? getUsuarioLogado();

  Future<void> clearPreferences();
}