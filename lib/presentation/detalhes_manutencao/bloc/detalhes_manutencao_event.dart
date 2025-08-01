part of 'detalhes_manutencao_bloc.dart';

abstract class DetalhesManutencaoEvent extends Equatable {
  const DetalhesManutencaoEvent();

  @override
  List<Object?> get props => [];
}

final class DetalhesManutencaoLoad extends DetalhesManutencaoEvent {
  const DetalhesManutencaoLoad({required this.manutencao});

  final ManutencaoVeiculoModel? manutencao;

  @override
  List<Object?> get props => [];
}

final class DetalhesManutencaoDelete extends DetalhesManutencaoEvent {
  const DetalhesManutencaoDelete({required this.manutencao});

  final ManutencaoModel manutencao;

  @override
  List<Object?> get props => [manutencao];
}
