import '../../../data/models/veiculo_model.dart';

abstract class VeiculoLocalRepository {
  Future<int> adicionar(VeiculoModel veiculo);

  Future<int> deletar({String? where, List<Object?>? whereArgs});

  Future<List<VeiculoModel?>> buscarTodos();
}