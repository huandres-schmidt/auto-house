import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/veiculo_model.dart';
import '../../../domain/controller/preference_controller.dart';
import '../../../domain/controller/veiculo_controller.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.veiculoController, this.preferenceController)
    : super(const HomeInitial()) {
    on<HomeLoad>(_onHomeLoad);
  }

  final VeiculoController veiculoController;
  final PreferenceController preferenceController;

  FutureOr<void> _onHomeLoad(HomeLoad event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeLoading());

      final veiculos = await veiculoController.getAll();
      final nome = preferenceController.getUserName();

      if (veiculos.isEmpty) {
        emit(HomeVeiculoEmpty(nome: nome));
        return;
      }

      emit(HomeLoaded(veiculos: veiculos, nome: nome ?? ''));
    } catch (e) {
      emit(HomeFail(message: e.toString()));
    }
  }
}
