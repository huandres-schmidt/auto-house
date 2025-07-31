part of 'manutencao_bloc.dart';

abstract class ManutencaoEvent extends Equatable {
  const ManutencaoEvent();

  @override
  List<Object?> get props => [];
}

final class ManutencaoLoad extends ManutencaoEvent {
  const ManutencaoLoad();

  @override
  List<Object?> get props => [];
}

final class ManutencaoSearch extends ManutencaoEvent {
  const ManutencaoSearch({required this.search});

  final String search;

  @override
  List<Object?> get props => [search];
}