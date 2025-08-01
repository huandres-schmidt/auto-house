part of 'detalhes_manutencao_bloc.dart';

abstract class DetalhesManutencaoState extends Equatable {
  const DetalhesManutencaoState({this.manutencao});

  final ManutencaoVeiculoModel? manutencao;

  @override
  List<Object?> get props => [manutencao];
}

final class DetalhesManutencaoInitial extends DetalhesManutencaoState {
  const DetalhesManutencaoInitial();

  @override
  List<Object?> get props => [];
}

final class DetalhesManutencaoLoading extends DetalhesManutencaoState {
  const DetalhesManutencaoLoading();

  @override
  List<Object?> get props => [];
}

final class DetalhesManutencaoLoaded extends DetalhesManutencaoState {
  const DetalhesManutencaoLoaded({super.manutencao});

  @override
  List<Object?> get props => [manutencao];
}

final class DetalhesManutencaoDeleted extends DetalhesManutencaoState {
  const DetalhesManutencaoDeleted();

  @override
  List<Object?> get props => [];
}

final class DetalhesManutencaoFail extends DetalhesManutencaoState {
  const DetalhesManutencaoFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}