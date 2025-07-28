part of 'historico_bloc.dart';

abstract class HistoricoState extends Equatable {
  const HistoricoState();

  @override
  List<Object?> get props => [];
}

final class HistoricoInitial extends HistoricoState {}

final class HistoricoLoading extends HistoricoState {}

final class HistoricoLoaded extends HistoricoState {
  final List<ManutencaoModel?> manutencoes;

  const HistoricoLoaded(this.manutencoes);
}

final class HistoricoFail extends HistoricoState {
  final String message;

  const HistoricoFail(this.message);

  @override
  List<Object?> get props => [message];
}