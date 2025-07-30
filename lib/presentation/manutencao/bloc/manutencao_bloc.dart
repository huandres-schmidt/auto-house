import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/manutencao_model.dart';
import '../../../domain/controller/manutencao_controller.dart';
part 'manutencao_event.dart';

part 'manutencao_state.dart';

class ManutencaoBloc extends Bloc<ManutencaoEvent, ManutencaoState> {
  ManutencaoBloc(this._manutencaoController)
    : super(const ManutencaoInitial()) {
    on<ManutencaoLoad>(_onManutencaoLoad);
  }

  final ManutencaoController _manutencaoController;

  FutureOr<void> _onManutencaoLoad(
    ManutencaoLoad event,
    Emitter<ManutencaoState> emit,
  ) async {
    try {
      final result = await _manutencaoController.listarManutencoes();
      if (result.isEmpty) {
        emit(const ManutencaoEmpty());
        return;
      }
      emit(ManutencaoLoaded(manutencoes: result));
    }catch (e) {
      emit(ManutencaoFail(e.toString()));
    }
  }
}
