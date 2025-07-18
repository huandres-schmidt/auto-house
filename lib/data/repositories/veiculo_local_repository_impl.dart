import 'package:pratica/core/constants/db_contants.dart';
import 'package:pratica/core/resources/base_local_data_source.dart';
import 'package:pratica/data/datasource/local/app_database.dart';
import 'package:pratica/domain/repositories/local/veiculo_local_repository.dart';

import '../models/veiculo_model.dart';

class VeiculoLocalRepositoryImpl extends BaseLocalDataSource<VeiculoModel>
    implements VeiculoLocalRepository {
  VeiculoLocalRepositoryImpl(AppDatabase appDatabase)
    : super(appDatabase, TableName.veiculo, VeiculoModel.fromJson);

  @override
  Future<int> adicionar(VeiculoModel veiculo) async {
    return await insert(veiculo);
  }

  @override
  Future<int> deletar({String? where, List<Object?>? whereArgs}) async {
    return await delete(where: where, whereArgs: whereArgs);
  }

  @override
  Future<List<VeiculoModel?>> buscarTodos() async {
    return await findAll();
  }
}
