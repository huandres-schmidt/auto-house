import 'package:bloc/bloc.dart';
import 'package:pratica/domain/controller/preference_controller.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._preferenceController) : super(AuthInitial()) {
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthNameSubmitted>(_onNameSubmitted);
  }

  final PreferenceController _preferenceController;

  Future<void> _onCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final nome = _preferenceController.getUserName();

    if (nome != null && nome.isNotEmpty) {
      emit(Authenticated(nome));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onNameSubmitted(
    AuthNameSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    await _preferenceController.setUserName(event.name);
    emit(Authenticated(event.name));
  }
}
