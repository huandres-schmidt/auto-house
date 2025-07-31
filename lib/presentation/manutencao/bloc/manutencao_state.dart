part of 'manutencao_bloc.dart';

abstract class ManutencaoState extends Equatable {
  const ManutencaoState({this.manutencoes = const []});

  final List<ManutencaoVeiculoModel?> manutencoes;

  @override
  List<Object?> get props => [manutencoes];
}

final class ManutencaoInitial extends ManutencaoState {
  const ManutencaoInitial();

  @override
  List<Object?> get props => [];
}

final class ManutencaoLoading extends ManutencaoState {
  const ManutencaoLoading();

  @override
  List<Object?> get props => [];
}

final class ManutencaoLoaded extends ManutencaoState {
  const ManutencaoLoaded({super.manutencoes});

  @override
  List<Object?> get props => [manutencoes];
}

final class ManutencaoEmpty extends ManutencaoState {
  const ManutencaoEmpty();

  @override
  List<Object?> get props => [];
}

final class ManutencaoFail extends ManutencaoState {
  const ManutencaoFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}