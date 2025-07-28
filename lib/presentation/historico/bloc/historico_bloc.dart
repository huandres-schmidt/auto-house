import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pratica/data/models/manutencao_model.dart';
import 'package:pratica/domain/controller/manutencao_controller.dart';

part 'historico_event.dart';

part 'historico_state.dart';

class HistoricoBloc extends Bloc<HistoricoEvent, HistoricoState> {
  HistoricoBloc(this._manutencaoController) : super(HistoricoInitial()) {
    on<HistoricoLoad>(_onHistorioLoad);
  }

  final ManutencaoController _manutencaoController;

  FutureOr<void> _onHistorioLoad(
    HistoricoLoad event,
    Emitter<HistoricoState> emit,
  ) async {
    try {
      emit(HistoricoLoading());
      final list = await _manutencaoController.getListManuntencaoById(event.id);

      emit(HistoricoLoaded(list));
    } catch (e) {
      emit(HistoricoFail(e.toString()));
    }
  }
}
