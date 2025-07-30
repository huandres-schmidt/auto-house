part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState({
    this.index = 0,
  });

  final int index;

  @override
  List<Object> get props => [index];
}

final class MenuInitial extends MenuState {
  const MenuInitial();

  @override
  List<Object> get props => [];
}

final class MenuLoading extends MenuState {
  const MenuLoading({super.index});

  @override
  List<Object> get props => [index];
}

final class MenuLoaded extends MenuState {
  const MenuLoaded({super.index});

  @override
  List<Object> get props => [index];
}

final class MenuFail extends MenuState {
  const MenuFail({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
