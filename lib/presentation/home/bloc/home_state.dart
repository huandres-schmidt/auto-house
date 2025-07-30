part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.veiculos = const [], this.nome = '',});

  final List<VeiculoModel?> veiculos;
  final String? nome;

  @override
  List<Object?> get props => [veiculos, nome];
}

final class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({required super.veiculos, required super.nome});

  @override
  List<Object?> get props => [veiculos, nome];
}

final class HomeVeiculoEmpty extends HomeState {
  const HomeVeiculoEmpty({required super.nome});

  @override
  List<Object?> get props => [nome];
}

final class HomeFail extends HomeState {
  const HomeFail({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
