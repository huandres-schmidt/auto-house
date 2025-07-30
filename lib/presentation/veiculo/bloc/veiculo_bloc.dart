import 'dart:async';

import 'package:autohouse/domain/controller/veiculo_controller.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/veiculo_model.dart';

part 'veiculo_event.dart';

part 'veiculo_state.dart';

class VeiculoBloc extends Bloc<VeiculoEvent, VeiculoState> {
  VeiculoBloc(this._veiculoController) : super(const VeiculoInitial()) {
    on<VeiculoLoad>(_onVeiculoLoad);
  }

  final VeiculoController _veiculoController;

  FutureOr<void> _onVeiculoLoad(
    VeiculoLoad event,
    Emitter<VeiculoState> emit,
  ) async {
    try {
      final result = await _veiculoController.getAll();
      if (result.isEmpty) {
        emit(const VeiculoEmpty());
        return;
      }
      emit(VeiculoLoaded(veiculos: result));
    } catch (e) {
      emit(VeiculoFail(e.toString()));
    }
  }
}
