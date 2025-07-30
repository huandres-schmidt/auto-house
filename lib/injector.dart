import 'package:autohouse/presentation/adicionar_manutencao/bloc/adicionar_manutencao_bloc.dart';
import 'package:autohouse/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';
import 'package:autohouse/presentation/auth/bloc/auth_bloc.dart';
import 'package:autohouse/presentation/historico/bloc/historico_bloc.dart';
import 'package:autohouse/presentation/home/bloc/home_bloc.dart';
import 'package:autohouse/presentation/manutencao/bloc/manutencao_bloc.dart';
import 'package:autohouse/presentation/menu/bloc/menu_bloc.dart';
import 'package:autohouse/presentation/veiculo/bloc/veiculo_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/shared/app_system_info.dart';
import 'data/datasource/local/app_database.dart';
import 'data/datasource/local/shared_data.dart';
import 'data/repositories/manutencao_local_repository_impl.dart';
import 'data/repositories/preferences/preferences_local_repository_impl.dart';
import 'data/repositories/veiculo_local_repository_impl.dart';
import 'domain/controller/manutencao_controller.dart';
import 'domain/controller/preference_controller.dart';
import 'domain/controller/veiculo_controller.dart';
import 'domain/repositories/local/manutencao_local_repository.dart';
import 'domain/repositories/local/veiculo_local_repository.dart';
import 'domain/repositories/preferences/preferences_local_repository.dart';
import 'external/datasource/local/app_database_impl.dart';
import 'external/datasource/local/shared_data_impl.dart';
import 'external/plugins/app_package_impl.dart';

final getIt = GetIt.instance;

abstract class Injector {
  Injector(this.getIt);

  late final GetIt getIt;

  void dispose();
}

final class InjectorImpl extends Injector {
  InjectorImpl._(super.getIt);

  static Future<Injector> initializeDependencies() async {
    final getIt = GetIt.instance;

    /// Plugins
    await AppSystemInfo.initialize(AppPackageImpl());

    /// Database----------------------------------------------------------------
    getIt.registerSingletonAsync<AppDatabase>(AppDatabaseImpl.initialize);

    getIt.registerSingletonAsync<SharedData>(SharedDataImpl.initialize);

    /// Preferences Repository--------------------------------------------------
    getIt.registerSingleton<PreferencesLocalRepository>(
      PreferencesLocalRepositoryImpl(await getIt.getAsync<SharedData>()),
    );

    /// Local Repository--------------------------------------------------------
    getIt.registerSingleton<VeiculoLocalRepository>(
      VeiculoLocalRepositoryImpl(await getIt.getAsync<AppDatabase>()),
    );

    getIt.registerSingleton<ManutencaoLocalRepository>(
      ManutencaoLocalRepositoryImpl(await getIt.getAsync<AppDatabase>()),
    );

    /// Remote Repository-------------------------------------------------------

    /// Controller--------------------------------------------------------------
    getIt.registerSingleton<VeiculoController>(
      VeiculoController(getIt.get<VeiculoLocalRepository>()),
    );

    getIt.registerSingleton<PreferenceController>(
      PreferenceController(getIt.get<PreferencesLocalRepository>()),
    );

    getIt.registerSingleton<ManutencaoController>(
      ManutencaoController(getIt.get<ManutencaoLocalRepository>()),
    );

    /// BLoC--------------------------------------------------------------------
    getIt.registerSingleton<HomeBloc>(
      HomeBloc(
        getIt.get<VeiculoController>(),
        getIt.get<PreferenceController>(),
      ),
    );

    getIt.registerSingleton<AdicionarVeiculoBloc>(
      AdicionarVeiculoBloc(getIt.get<VeiculoController>()),
    );

    getIt.registerSingleton<AuthBloc>(
      AuthBloc(getIt.get<PreferenceController>()),
    );

    getIt.registerSingleton<AdicionarManutencaoBloc>(
      AdicionarManutencaoBloc(getIt.get<ManutencaoController>()),
    );

    getIt.registerSingleton<HistoricoBloc>(
      HistoricoBloc(getIt.get<ManutencaoController>()),
    );

    getIt.registerSingleton<MenuBloc>(MenuBloc());

    getIt.registerSingleton<ManutencaoBloc>(
      ManutencaoBloc(getIt.get<ManutencaoController>()),
    );

    getIt.registerSingleton<VeiculoBloc>(
      VeiculoBloc(getIt.get<VeiculoController>()),
    );

    return InjectorImpl._(getIt);
  }

  @override
  void dispose() {
    Future.wait([]);
  }
}
