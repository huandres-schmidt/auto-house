import 'package:autohouse/data/models/manutencao_veiculo_model.dart';
import 'package:autohouse/domain/repositories/local/veiculo_local_repository.dart';

import '../../data/models/manutencao_model.dart';
import '../repositories/local/manutencao_local_repository.dart';

class ManutencaoController {
  final ManutencaoLocalRepository _manutencaoLocalRepository;
  final VeiculoLocalRepository _veiculoLocalRepository;

  ManutencaoController(
    this._manutencaoLocalRepository,
    this._veiculoLocalRepository,
  );

  Future<void> adicionarManutencao(ManutencaoModel manutencao) async {
    await _manutencaoLocalRepository.adicionar(manutencao);
  }

  Future<List<ManutencaoModel?>> getListManuntencaoById(int id) async {
    return await _manutencaoLocalRepository.getAllManutencoes().then(
      (manutencoes) =>
          manutencoes
              .where((manutencao) => manutencao?.veiculoId == id)
              .toList(),
    );
  }

  Future<List<ManutencaoVeiculoModel>> getListManutencao() async {
    final manutencao = await _manutencaoLocalRepository.getAllManutencoes();
    final veiculo = await _veiculoLocalRepository.buscarTodos();

    return manutencao.map((v) {
      final manutencaoVeiculo = ManutencaoVeiculoModel(
        veiculo: veiculo.where((element) => element?.id == v?.veiculoId,).firstOrNull,
        manutecao: v,
      );
      return manutencaoVeiculo;
    }).toList();
  }

  void manutencaoValid(ManutencaoModel manutencao) {
    if (manutencao.tipo == null) {
      throw Exception('Tipo de manutenção é obrigatório');
    }
  }
}
