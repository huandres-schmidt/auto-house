import 'package:flutter/material.dart';
import 'package:pratica/injector.dart';
import 'package:pratica/presentation/adicionar_manutencao/adicionar_manutencao_screen.dart';
import 'package:pratica/presentation/adicionar_veiculo/adicionar_veiculo_screen.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';
import 'package:pratica/presentation/inicio/inicio_screen.dart';

import '../data/models/veiculo_model.dart';
import '../presentation/adicionar_manutencao/bloc/adicionar_manutencao_bloc.dart';
import '../presentation/components/animation/modal_page_route.dart';
import '../presentation/historico_veiculo/historico_veiculo_screen.dart';
import '../presentation/home/bloc/home_bloc.dart';
import '../presentation/home/home_screen.dart';

enum NavigationFlow { simple, modalBottomUp }

enum AppRoutes {
  root('/', NavigationFlow.simple),
  home('/home', NavigationFlow.simple),
  adicionarVeiculo('/adicionar-veiculo', NavigationFlow.simple),
  historicoVeiculo('/historico-veiculo', NavigationFlow.simple),
  adicionarManutencao('/adicionar-manutencao', NavigationFlow.modalBottomUp);

  final String route;
  final NavigationFlow flow;

  const AppRoutes(this.route, this.flow);

  static AppRoutes fromName(String? screenName) {
    return AppRoutes.values.firstWhere(
      (e) => e.route == screenName,
      orElse: () => root,
    );
  }
}

class Routes {
  static PageRoute router(RouteSettings settings, Injector injector) {
    final appRoute = AppRoutes.fromName(settings.name);

    final Widget screen = switch (appRoute) {
      AppRoutes.home => HomeScreen(homeBloc: injector.getIt.get<HomeBloc>()),
      AppRoutes.adicionarVeiculo => AdicionarScreen(
        adicionarVeiculoBloc: injector.getIt.get<AdicionarVeiculoBloc>(),
      ),
      AppRoutes.root => InicioScreen(),
      AppRoutes.historicoVeiculo => HistoricoVeiculoScreen(
        veiculo: settings.arguments as VeiculoModel,
      ),
      AppRoutes.adicionarManutencao => AdicionarManutencaoScreen(
        adicionarManutencaoBloc: injector.getIt.get<AdicionarManutencaoBloc>(),
      ),
    };

    return switch (appRoute.flow) {
      NavigationFlow.modalBottomUp => ModalPageRoute(
        builder: (context) => screen,
        modalSettings: settings,
      ),
      NavigationFlow.simple => MaterialPageRoute(
        builder: (context) => screen,
        settings: settings,
      ),
    };
  }
}
