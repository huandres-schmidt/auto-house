import 'dart:async';

import 'package:autohouse/data/models/manutencao_veiculo_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/controller/manutencao_controller.dart';

part 'manutencao_event.dart';

part 'manutencao_state.dart';

class ManutencaoBloc extends Bloc<ManutencaoEvent, ManutencaoState> {
  ManutencaoBloc(this._manutencaoController)
    : super(const ManutencaoInitial()) {
    on<ManutencaoLoad>(_onManutencaoLoad);
    on<ManutencaoSearch>(_onManutencaoSearch);
  }

  final ManutencaoController _manutencaoController;

  FutureOr<void> _onManutencaoLoad(
    ManutencaoLoad event,
    Emitter<ManutencaoState> emit,
  ) async {
    try {
      final result = await _manutencaoController.getListManutencao();

      if (result.isEmpty) {
        emit(const ManutencaoEmpty());
        return;
      }
      emit(ManutencaoLoaded(manutencoes: result));
    } catch (e) {
      emit(ManutencaoFail(e.toString()));
    }
  }

  FutureOr<void> _onManutencaoSearch(
    ManutencaoSearch event,
    Emitter<ManutencaoState> emit,
  ) async {
    final search = await _manutencaoController.getListManutencaoBySearch(
      event.search,
    );

    if (search.isEmpty) {
      emit(const ManutencaoEmpty());
      return;
    }

    emit(ManutencaoLoaded(manutencoes: search));
  }
}
