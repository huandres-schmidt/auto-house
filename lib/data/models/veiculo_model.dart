import 'package:pratica/core/enum/marcas.dart';
import 'package:pratica/core/resources/base_model.dart';

import '../../core/enum/cores.dart';

class VeiculoModel extends BaseModel {
  final int? id;
  final String? placa;
  final String? modelo;
  final String? quilometragem;
  final int? ano;
  final Cores? cor;
  final Marcas? marca;

  VeiculoModel({
    this.id,
    this.placa,
    this.modelo,
    this.quilometragem,
    this.ano,
    this.cor,
    this.marca,
  });

  factory VeiculoModel.fromJson(Map<String, dynamic> json) {
    return VeiculoModel(
      id: json['id'] as int?,
      placa: json['placa'] as String?,
      modelo: json['modelo'] as String?,
      quilometragem: json['quilometragem'] as String?,
      ano: json['ano'] as int?,
      cor:
          json['cor'] != null
              ? Cores.values.firstWhere((e) => e.name == json['cor'])
              : null,
      marca:
          json['marca'] != null
              ? Marcas.values.firstWhere((e) => e.name == json['marca'])
              : null,
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
      'cor': cor?.name,
      'marca': marca?.name,
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
        "cor: ${cor?.name},"
        "marca: ${marca?.name}"
        ")";
  }
}
