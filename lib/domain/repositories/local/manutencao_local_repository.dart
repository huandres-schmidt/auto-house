import '../../../data/models/manutencao_model.dart';

abstract class ManutencaoLocalRepository {
  Future<void> adicionar(ManutencaoModel manutencao);

  Future<void> deleteManutencao(int id);

  Future<List<ManutencaoModel?>> getAllManutencoes();
}