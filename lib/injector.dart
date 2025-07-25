import 'package:get_it/get_it.dart';
import 'package:pratica/core/shared/app_system_info.dart';
import 'package:pratica/data/repositories/manutencao_local_repository_impl.dart';
import 'package:pratica/data/repositories/veiculo_local_repository_impl.dart';
import 'package:pratica/domain/controller/manutencao_controller.dart';
import 'package:pratica/domain/controller/preference_controller.dart';
import 'package:pratica/domain/controller/veiculo_controller.dart';
import 'package:pratica/domain/repositories/local/manutencao_local_repository.dart';
import 'package:pratica/domain/repositories/preferences/preferences_local_repository.dart';
import 'package:pratica/external/plugins/app_package_impl.dart';
import 'package:pratica/presentation/adicionar_manutencao/bloc/adicionar_manutencao_bloc.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';
import 'package:pratica/presentation/auth/bloc/auth_bloc.dart';
import 'package:pratica/presentation/home/bloc/home_bloc.dart';

import 'data/datasource/local/app_database.dart';
import 'data/datasource/local/shared_data.dart';
import 'data/repositories/preferences/preferences_local_repository_impl.dart';
import 'domain/repositories/local/veiculo_local_repository.dart';
import 'external/datasource/local/app_database_impl.dart';
import 'external/datasource/local/shared_data_impl.dart';

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
    getIt.registerSingleton<HomeBloc>(HomeBloc(getIt.get<VeiculoController>()));

    getIt.registerSingleton<AdicionarVeiculoBloc>(
      AdicionarVeiculoBloc(getIt.get<VeiculoController>()),
    );

    getIt.registerSingleton<AuthBloc>(
      AuthBloc(getIt.get<PreferenceController>()),
    );

    getIt.registerSingleton<AdicionarManutencaoBloc>(
      AdicionarManutencaoBloc(getIt.get<ManutencaoController>()),
    );

    return InjectorImpl._(getIt);
  }

  @override
  void dispose() {
    Future.wait([]);
  }
}
