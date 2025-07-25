part of 'adicionar_manutencao_bloc.dart';

abstract class AdicionarManutencaoEvent extends Equatable {
  const AdicionarManutencaoEvent();

  @override
  List<Object> get props => [];
}

class AdicionarManutencaoLoad extends AdicionarManutencaoEvent {
  const AdicionarManutencaoLoad();

  @override
  List<Object> get props => [];
}

class AdicionarManutencaoAdd extends AdicionarManutencaoEvent {
  const AdicionarManutencaoAdd({required this.manutencao});

  final ManutencaoModel manutencao;

  @override
  List<Object> get props => [manutencao];
}
