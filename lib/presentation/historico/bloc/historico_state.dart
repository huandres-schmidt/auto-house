part of 'historico_bloc.dart';

abstract class HistoricoState extends Equatable {
  const HistoricoState({this.manutencoes = const []});

  final List<ManutencaoModel?> manutencoes;

  @override
  List<Object?> get props => [manutencoes];
}

final class HistoricoInitial extends HistoricoState {}

final class HistoricoLoading extends HistoricoState {}

final class HistoricoLoaded extends HistoricoState {
  const HistoricoLoaded({super.manutencoes});
}

final class HistoricoFail extends HistoricoState {
  final String message;

  const HistoricoFail(this.message);

  @override
  List<Object?> get props => [message];
}