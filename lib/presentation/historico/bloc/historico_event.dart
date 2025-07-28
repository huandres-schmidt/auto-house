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