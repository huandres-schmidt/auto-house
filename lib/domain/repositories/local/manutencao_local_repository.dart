import 'package:pratica/data/models/manutencao_model.dart';

abstract class ManutencaoLocalRepository {
  Future<void> adicionar(ManutencaoModel manutencao);

  Future<void> deleteManutencao(String id);

  Future<List<ManutencaoModel?>> getAllManutencoes();
}