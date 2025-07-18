part of 'adicionar_veiculo_bloc.dart';

abstract class AdicionarVeiculoEvent extends Equatable {
  const AdicionarVeiculoEvent();

  @override
  List<Object?> get props => [];
}

class AdicionarVeiculoLoad extends AdicionarVeiculoEvent {
  const AdicionarVeiculoLoad();

  @override
  List<Object?> get props => [];
}

class AdicionarVeiculoAdd extends AdicionarVeiculoEvent {
  const AdicionarVeiculoAdd({
    required this.veiculo,
  });

  final VeiculoModel veiculo;

  @override
  List<Object?> get props => [veiculo];
}

