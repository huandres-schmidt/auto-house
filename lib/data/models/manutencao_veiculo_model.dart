import 'package:autohouse/data/models/manutencao_model.dart';
import 'package:autohouse/data/models/veiculo_model.dart';

class ManutencaoVeiculoModel {
  final VeiculoModel? veiculo;
  final ManutencaoModel? manutecao;

  ManutencaoVeiculoModel({this.veiculo, this.manutecao});

  @override
  String toString() {
    return 'ManutencaoVeiculoModel(veiculo: $veiculo, manutecao: $manutecao)';
  }
}
