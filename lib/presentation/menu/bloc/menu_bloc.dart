import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuInitial()) {
    on<MenuLoad>(_onMenuLoad);
    on<MenuChangeScreen>(_onMenuChangeScreen);
  }

  FutureOr<void> _onMenuLoad(MenuLoad event, Emitter<MenuState> emit) async {
    try {
      emit(const MenuLoading());
      emit(MenuLoaded(index: state.index));
    } catch (e) {
      emit(
        MenuFail(message: "Falha ao carregar dados no menu\n ${e.toString()}"),
      );
    }
  }

  FutureOr<void> _onMenuChangeScreen(
    MenuChangeScreen event,
    Emitter<MenuState> emit,
  ) {
    try {
      emit(MenuLoaded(index: event.index));
    } catch (e) {
      emit(
        MenuFail(message: "Falha ao mudar a tela do menu\n ${e.toString()}"),
      );
    }
  }
}
