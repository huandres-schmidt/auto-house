import 'package:pratica/core/constants/db_contants.dart';
import 'package:pratica/core/resources/base_local_data_source.dart';
import 'package:pratica/data/datasource/local/app_database.dart';
import 'package:pratica/data/models/manutencao_model.dart';
import 'package:pratica/domain/repositories/local/manutencao_local_repository.dart';

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
