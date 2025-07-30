part of 'veiculo_bloc.dart';

abstract class VeiculoState extends Equatable {
  const VeiculoState({this.veiculos = const []});

  final List<VeiculoModel?> veiculos;

  @override
  List<Object?> get props => [veiculos];
}

final class VeiculoInitial extends VeiculoState {
  const VeiculoInitial();

  @override
  List<Object?> get props => [];
}

final class VeiculoLoading extends VeiculoState {
  const VeiculoLoading();

  @override
  List<Object?> get props => [];
}

final class VeiculoLoaded extends VeiculoState {
  const VeiculoLoaded({super.veiculos});

  @override
  List<Object?> get props => [veiculos];
}

final class VeiculoEmpty extends VeiculoState {
  const VeiculoEmpty();

  @override
  List<Object?> get props => [];
}

final class VeiculoFail extends VeiculoState {
  const VeiculoFail(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}