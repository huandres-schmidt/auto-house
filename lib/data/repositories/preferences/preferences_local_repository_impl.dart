import 'package:pratica/core/enum/preferences.dart';
import 'package:pratica/domain/repositories/preferences/preferences_local_repository.dart';

import '../../datasource/local/shared_data.dart';

class PreferencesLocalRepositoryImpl implements PreferencesLocalRepository {
  PreferencesLocalRepositoryImpl(this._sharedData);

  final SharedData _sharedData;

  @override
  Future<void> clearPreferences() async {
    return await _sharedData.clearValues();
  }

  @override
  Future<void> setNome(String name) async {
    await _sharedData.setValue(Preferences.nomePessoa, name);
  }

  @override
  String? getNome() {
    return _sharedData.getValue<String>(Preferences.nomePessoa);
  }


  @override
  Future<void> setUsuarioLogado(bool isLogado) async {
    await _sharedData.setValue(Preferences.usuarioLogado, isLogado);
  }

  @override
  bool? getUsuarioLogado() {
    return _sharedData.getValue<bool>(Preferences.usuarioLogado);
  }

}