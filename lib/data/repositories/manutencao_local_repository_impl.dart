import '../../core/constants/db_contants.dart';
import '../../core/resources/base_local_data_source.dart';
import '../../domain/repositories/local/manutencao_local_repository.dart';
import '../datasource/local/app_database.dart';
import '../models/manutencao_model.dart';

class ManutencaoLocalRepositoryImpl extends BaseLocalDataSource<ManutencaoModel>
    implements ManutencaoLocalRepository {
  ManutencaoLocalRepositoryImpl(AppDatabase appDatabase)
    : super(appDatabase, TableName.manutencao, ManutencaoModel.fromJson);

  @override
  Future<void> deleteManutencao(String id) {
    // TODO: implement deleteManutencao
    throw UnimplementedError();
  }

  @override
  Future<List<ManutencaoModel?>> getAllManutencoes() async {
    return await findAll();
  }

  @override
  Future<void> adicionar(ManutencaoModel manutencao) async {
    await insert(manutencao);
  }
}
