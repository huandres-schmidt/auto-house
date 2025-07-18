part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.veiculos = const []});

  final List<VeiculoModel?> veiculos;

  @override
  List<Object> get props => [veiculos];
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
  const HomeLoaded({required super.veiculos});

  @override
  List<Object> get props => [veiculos];
}

final class HomeFail extends HomeState {
  const HomeFail({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
