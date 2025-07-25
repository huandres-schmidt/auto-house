part of 'adicionar_manutencao_bloc.dart';

abstract class AdicionarManutencaoState extends Equatable {
  const AdicionarManutencaoState();

  @override
  List<Object> get props => [];
}

class AdicionarManutencaoInitial extends AdicionarManutencaoState {
  const AdicionarManutencaoInitial();

  @override
  List<Object> get props => [];
}

class AdicionarManutencaoLoading extends AdicionarManutencaoState {
  const AdicionarManutencaoLoading();

  @override
  List<Object> get props => [];
}

class AdicionarManutencaoLoaded extends AdicionarManutencaoState {
  const AdicionarManutencaoLoaded();

  @override
  List<Object> get props => [];
}

class AdicionarManutencaoFail extends AdicionarManutencaoState {
  const AdicionarManutencaoFail({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class AdicionarManutencaoSuccess extends AdicionarManutencaoState {
  const AdicionarManutencaoSuccess();

  @override
  List<Object> get props => [];
}