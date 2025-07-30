import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/manutencao_model.dart';
import '../../../domain/controller/manutencao_controller.dart';

part 'adicionar_manutencao_event.dart';

part 'adicionar_manutencao_state.dart';

class AdicionarManutencaoBloc
    extends Bloc<AdicionarManutencaoEvent, AdicionarManutencaoState> {
  AdicionarManutencaoBloc(this._manutencaoController)
    : super(const AdicionarManutencaoInitial()) {
    on<AdicionarManutencaoLoad>(_onAdicionarManutencaoLoad);
    on<AdicionarManutencaoAdd>(_onAdicionarManutencaoAdd);
  }

  final ManutencaoController _manutencaoController;

  FutureOr<void> _onAdicionarManutencaoLoad(
    AdicionarManutencaoLoad event,
    Emitter<AdicionarManutencaoState> emit,
  ) {
    try {
      emit(const AdicionarManutencaoLoading());
      emit(const AdicionarManutencaoLoaded());
    } catch (e) {
      emit(AdicionarManutencaoFail(message: e.toString()));
    }
  }

  FutureOr<void> _onAdicionarManutencaoAdd(
    AdicionarManutencaoAdd event,
    Emitter<AdicionarManutencaoState> emit,
  ) async {
    try {
      emit(const AdicionarManutencaoLoading());
      _manutencaoController.manutencaoValid(event.manutencao);
      await _manutencaoController.adicionarManutencao(event.manutencao);
      emit(const AdicionarManutencaoSuccess());
    } catch (e) {
      emit(AdicionarManutencaoFail(message: e.toString()));
    }
  }
}
