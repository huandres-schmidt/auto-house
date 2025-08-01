import 'dart:async';

import 'package:autohouse/data/models/manutencao_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/manutencao_veiculo_model.dart';
import '../../../domain/controller/manutencao_controller.dart';

part 'detalhes_manutencao_event.dart';

part 'detalhes_manutencao_state.dart';

class DetalhesManutencaoBloc
    extends Bloc<DetalhesManutencaoEvent, DetalhesManutencaoState> {
  DetalhesManutencaoBloc(this._manutencaoController)
    : super(const DetalhesManutencaoInitial()) {
    on<DetalhesManutencaoLoad>(_onDetalhesManutencaoLoad);
    on<DetalhesManutencaoDelete>(_onDetalhesManutencaoDelete);
  }

  final ManutencaoController _manutencaoController;

  FutureOr<void> _onDetalhesManutencaoLoad(
    DetalhesManutencaoLoad event,
    Emitter<DetalhesManutencaoState> emit,
  ) async {
    try {
      emit(const DetalhesManutencaoLoading());
      emit(DetalhesManutencaoLoaded(manutencao: event.manutencao));
    } catch (e) {
      emit(DetalhesManutencaoFail(e.toString()));
    }
  }

  FutureOr<void> _onDetalhesManutencaoDelete(
    DetalhesManutencaoDelete event,
    Emitter<DetalhesManutencaoState> emit,
  ) async {
    try {
      emit(const DetalhesManutencaoLoading());
      await _manutencaoController.deleteManutencao(event.manutencao);
      emit(const DetalhesManutencaoDeleted());
    } catch (e) {
      emit(DetalhesManutencaoFail(e.toString()));
    }
  }
}
