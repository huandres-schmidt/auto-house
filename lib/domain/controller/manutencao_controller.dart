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

  Future<List<ManutencaoVeiculoModel?>> getListManuntencaoById(int id) async {
    final manutencao = await getListManutencao();

    return manutencao.where((element) => element.veiculo?.id == id).toList();
  }

  Future<List<ManutencaoVeiculoModel>> getListManutencao() async {
    final manutencao = await _manutencaoLocalRepository.getAllManutencoes();
    final veiculo = await _veiculoLocalRepository.buscarTodos();

    return manutencao.map((v) {
      final manutencaoVeiculo = ManutencaoVeiculoModel(
        veiculo:
            veiculo.where((element) => element?.id == v?.veiculoId).firstOrNull,
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

  Future<List<ManutencaoVeiculoModel>> getListManutencaoBySearch(
    String search,
  ) async {
    final manutencoes = await getListManutencao();

    if (search.isEmpty) {
      return manutencoes;
    }

    return manutencoes.where((e) {
      final veiculo = e.veiculo;
      if (veiculo == null) return false;

      final searchLower = search.toLowerCase();
      return veiculo.marca!.nome.contains(searchLower) ||
          veiculo.modelo!.toLowerCase().contains(searchLower) ||
          veiculo.placa!.toLowerCase().contains(searchLower) ||
          e.manutecao!.observacao!.toLowerCase().contains(searchLower) ||
          e.manutecao!.tipo!.tipo.toLowerCase().contains(searchLower) ||
          e.manutecao!.data!.toLowerCase().contains(searchLower) ||
          e.manutecao!.valor!.toString().contains(searchLower) ||
          e.manutecao!.quilometragem!.toString().contains(searchLower) ||
          e.manutecao!.marca!.toLowerCase().contains(searchLower);
    }).toList();
  }

  Future<void> deleteManutencao(ManutencaoModel manutencao) async {
    await _manutencaoLocalRepository.deleteManutencao(manutencao.id!);
  }
}
