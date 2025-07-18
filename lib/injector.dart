import 'package:get_it/get_it.dart';
import 'package:pratica/data/repositories/veiculo_local_repository_impl.dart';
import 'package:pratica/domain/controller/veiculo_controller.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';
import 'package:pratica/presentation/home/bloc/home_bloc.dart';

import 'data/datasource/local/app_database.dart';
import 'domain/repositories/local/veiculo_local_repository.dart';
import 'external/datasource/local/app_database_impl.dart';

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

    /// Database----------------------------------------------------------------
    getIt.registerSingletonAsync<AppDatabase>(
      AppDatabaseImpl.initialize,
    );

    // getIt.registerSingletonAsync<SharedData>(SharedDataImpl.initialize);

    /// Preferences Repository--------------------------------------------------

    /// Local Repository--------------------------------------------------------
    getIt.registerSingleton<VeiculoLocalRepository>(
      VeiculoLocalRepositoryImpl(await getIt.getAsync<AppDatabase>()),
    );

    /// Remote Repository-------------------------------------------------------

    /// Controller--------------------------------------------------------------
    getIt.registerSingleton<VeiculoController>(
      VeiculoController(
        getIt.get<VeiculoLocalRepository>(),
      ),
    );

    /// BLoC--------------------------------------------------------------------
    getIt.registerSingleton<HomeBloc>(
      HomeBloc(
        getIt.get<VeiculoController>()
      ),
    );

    getIt.registerSingleton<AdicionarVeiculoBloc>(
      AdicionarVeiculoBloc(
        getIt.get<VeiculoController>(),
      ),
    );

    return InjectorImpl._(getIt);
  }

  @override
  void dispose() {
    Future.wait([]);
  }
}
