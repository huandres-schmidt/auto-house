part of 'adicionar_veiculo_bloc.dart';

abstract class AdicionarVeiculoState extends Equatable {
  const AdicionarVeiculoState();

  @override
  List<Object?> get props => [];
}

class AdicionarVeiculoInitial extends AdicionarVeiculoState {
  const AdicionarVeiculoInitial();

  @override
  List<Object?> get props => [];
}

class AdicionarVeiculoLoading extends AdicionarVeiculoState {
  const AdicionarVeiculoLoading();

  @override
  List<Object?> get props => [];
}

class AdicionarVeiculoLoaded extends AdicionarVeiculoState {
  const AdicionarVeiculoLoaded();

  @override
  List<Object?> get props => [];
}

class AdicionarVeiculoFail extends AdicionarVeiculoState {
  const AdicionarVeiculoFail({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class AdicionarVeiculoSuccess extends AdicionarVeiculoState {
  const AdicionarVeiculoSuccess();

  @override
  List<Object?> get props => [];
}