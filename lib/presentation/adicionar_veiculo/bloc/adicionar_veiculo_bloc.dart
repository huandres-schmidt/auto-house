import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/domain/controller/veiculo_controller.dart';

part 'adicionar_veiculo_event.dart';

part 'adicionar_veiculo_state.dart';

class AdicionarVeiculoBloc
    extends Bloc<AdicionarVeiculoEvent, AdicionarVeiculoState> {
  AdicionarVeiculoBloc(this.veiculoController)
    : super(const AdicionarVeiculoInitial()) {
    on<AdicionarVeiculoLoad>(_onAdicionarVeiculoLoad);
    on<AdicionarVeiculoAdd>(_onAdicionarVeiculo);
  }

  final VeiculoController veiculoController;

  FutureOr<void> _onAdicionarVeiculoLoad(
    AdicionarVeiculoLoad event,
    Emitter<AdicionarVeiculoState> emit,
  ) {
    try {
      emit(const AdicionarVeiculoLoading());
      emit(const AdicionarVeiculoLoaded());
    } catch (e) {
      emit(AdicionarVeiculoFail(message: e.toString()));
    }
  }

  FutureOr<void> _onAdicionarVeiculo(
    AdicionarVeiculoAdd event,
    Emitter<AdicionarVeiculoState> emit,
  ) async {
    try {
      emit(const AdicionarVeiculoLoading());
      veiculoController.isVeiculoValid(event.veiculo);
      await veiculoController.isVeiculoExist(event.veiculo.placa ?? '');
      await veiculoController.insert(event.veiculo);
      emit(const AdicionarVeiculoSuccess());
    } catch (e) {
      emit(AdicionarVeiculoFail(message: e.toString()));
    }
  }
}
