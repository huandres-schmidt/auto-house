part of 'veiculo_bloc.dart';

abstract class VeiculoEvent extends Equatable {
  const VeiculoEvent();

  @override
  List<Object?> get props => [];
}

final class VeiculoLoad extends VeiculoEvent {
  const VeiculoLoad();

  @override
  List<Object?> get props => [];
}