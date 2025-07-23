import 'package:pratica/domain/repositories/preferences/preferences_local_repository.dart';

class PreferenceController {
  final PreferencesLocalRepository preferencesLocalRepository;

  PreferenceController(this.preferencesLocalRepository);

  String? getUserName() {
    return preferencesLocalRepository.getNome();
  }

  Future<void> setUserName(String name) async {
    await preferencesLocalRepository.setNome(name);
  }

  Future<void> setUsuarioLogado(bool isLoggedIn) async {
    await preferencesLocalRepository.setUsuarioLogado(isLoggedIn);
  }

  bool? isUsuarioLogado() {
    return preferencesLocalRepository.getUsuarioLogado();
  }
}