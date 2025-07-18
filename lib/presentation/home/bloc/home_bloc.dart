import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/domain/controller/veiculo_controller.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.veiculoController) : super(const HomeInitial()) {
    on<HomeLoad>(_onHomeLoad);
  }

  final VeiculoController veiculoController;

  FutureOr<void> _onHomeLoad(HomeLoad event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeLoading());

      final veiculos = await veiculoController.getAll();

      emit(HomeLoaded(veiculos: veiculos));
    } catch (e) {
      emit(HomeFail(message: e.toString()));
    }
  }
}
