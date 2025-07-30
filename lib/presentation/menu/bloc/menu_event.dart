part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

final class MenuLoad extends MenuEvent {
  const MenuLoad();

  @override
  List<Object> get props => [];
}

final class MenuChangeScreen extends MenuEvent {
  const MenuChangeScreen(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}