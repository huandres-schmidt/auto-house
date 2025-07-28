import 'package:pratica/data/models/manutencao_model.dart';
import 'package:pratica/domain/repositories/local/manutencao_local_repository.dart';

class ManutencaoController {
  final ManutencaoLocalRepository _manutencaoLocalRepository;

  ManutencaoController(this._manutencaoLocalRepository);

  Future<void> adicionarManutencao(ManutencaoModel manutencao) async {
    await _manutencaoLocalRepository.adicionar(manutencao);
  }

  Future<List<ManutencaoModel?>> listarManutencoes() async {
    return await _manutencaoLocalRepository.getAllManutencoes();
  }

  Future<List<ManutencaoModel?>> getListManuntencaoById(int id) async {
    return await _manutencaoLocalRepository.getAllManutencoes().then(
      (manutencoes) =>
          manutencoes
              .where((manutencao) => manutencao?.veiculoId == id)
              .toList(),
    );
  }
}
