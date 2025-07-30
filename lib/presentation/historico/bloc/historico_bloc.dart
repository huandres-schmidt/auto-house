import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/manutencao_model.dart';
import '../../../domain/controller/manutencao_controller.dart';

part 'historico_event.dart';

part 'historico_state.dart';

class HistoricoBloc extends Bloc<HistoricoEvent, HistoricoState> {
  HistoricoBloc(this._manutencaoController)
      : super(HistoricoInitial()) {
    on<HistoricoLoad>(_onHistorioLoad);
  }

  final ManutencaoController _manutencaoController;

  FutureOr<void> _onHistorioLoad(HistoricoLoad event,
      Emitter<HistoricoState> emit,) async {
    try {
      emit(HistoricoLoading());
      final list = await _manutencaoController.getListManuntencaoById(event.id);
      emit(HistoricoLoaded(manutencoes: list.reversed.toList()));
    } catch (e) {
      emit(HistoricoFail(e.toString()));
    }
  }
}
