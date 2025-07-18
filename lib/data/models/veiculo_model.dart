import 'package:pratica/core/resources/base_model.dart';

class VeiculoModel extends BaseModel {
  final int? id;
  final String? placa;
  final String? modelo;
  final String? quilometragem;
  final int? ano;
  final String? cor;

  VeiculoModel({
    this.id,
    this.placa,
    this.modelo,
    this.quilometragem,
    this.ano,
    this.cor,
  });

  factory VeiculoModel.fromJson(Map<String, dynamic> json) {
    return VeiculoModel(
      id: json['id'] as int?,
      placa: json['placa'] as String?,
      modelo: json['modelo'] as String?,
      quilometragem: json['quilometragem'] as String?,
      ano: json['ano'] as int?,
      cor: json['cor'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'placa': placa,
      'modelo': modelo,
      'quilometragem': quilometragem,
      'ano': ano,
      'cor': cor,
    };
  }

  @override
  String toString() {
    return "VeiculoModel("
        "id: $id, "
        "placa: $placa,"
        " modelo: $modelo, "
        "quilometragem: $quilometragem, "
        "ano: $ano, "
        "cor: $cor,"
        ")";
  }
}
