part of 'historico_bloc.dart';

abstract class HistoricoEvent extends Equatable {
  const HistoricoEvent();

  @override
  List<Object?> get props => [];
}

final class HistoricoLoad extends HistoricoEvent {
  const HistoricoLoad(this.id);

  final int id;

  @override
  List<Object?> get props => [];
}

final class HistoricoDeletarVeiculo extends HistoricoEvent {
  const HistoricoDeletarVeiculo(this.id, this.campo);

  final int id;
  final String campo;

  @override
  List<Object?> get props => [id, campo];
}