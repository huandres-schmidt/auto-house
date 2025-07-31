import 'package:autohouse/data/models/veiculo_model.dart';

import '../../core/enum/tipo.dart';
import '../../core/resources/base_model.dart';

class ManutencaoModel extends BaseModel {
  final int? id;
  final int? veiculoId;
  final Tipo? tipo;
  final String? nomePeca;
  final String? marca;
  final String? quilometragem;
  final String? data;
  final double? valor;
  final String? observacao;
  final VeiculoModel? veiculo;

  ManutencaoModel({
    this.id,
    this.veiculoId,
    this.tipo,
    this.nomePeca,
    this.marca,
    this.quilometragem,
    this.data,
    this.valor,
    this.observacao,
    this.veiculo,
  });

  ManutencaoModel copyWith({
    int? id,
    int? veiculoId,
    Tipo? tipo,
    String? nomePeca,
    String? marca,
    String? quilometragem,
    String? data,
    double? valor,
    String? observacao,
    VeiculoModel? veiculo,
  }) {
    return ManutencaoModel(
      id: id ?? this.id,
      veiculoId: veiculoId ?? this.veiculoId,
      tipo: tipo ?? this.tipo,
      nomePeca: nomePeca ?? this.nomePeca,
      marca: marca ?? this.marca,
      quilometragem: quilometragem ?? this.quilometragem,
      data: data ?? this.data,
      valor: valor ?? this.valor,
      observacao: observacao ?? this.observacao,
      veiculo: veiculo ?? this.veiculo,
    );
  }

  factory ManutencaoModel.fromJson(Map<String, dynamic> json) {
    return ManutencaoModel(
      id: json['id'] as int?,
      veiculoId: json['veiculo_id'] as int?,
      tipo: json['tipo'] != null
          ? Tipo.values.firstWhere((e) => e.name == json['tipo'])
          : null,
      nomePeca: json['peca'] as String?,
      marca: json['marca'] as String?,
      quilometragem: json['quilometragem'] as String?,
      data: json['data'] as String?,
      valor: (json['valor'] as num?)?.toDouble(),
      observacao: json['descricao'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'veiculo_id': veiculoId,
      'tipo': tipo?.name,
      'peca': nomePeca,
      'marca': marca,
      'quilometragem': quilometragem,
      'data': data,
      'valor': valor,
      'descricao': observacao,
    };
  }

  @override
  String toString() {
    return 'ManutencaoModel{'
        'id: $id, '
        'veiculoId: $veiculoId,'
        ' tipo: $tipo,'
        ' peca: $nomePeca, '
        'marca: $marca,'
        ' quilometragem: $quilometragem, '
        'data: $data, '
        'valor: $valor,'
        ' descricao: $observacao,'
        'veiculo: $veiculo'
        '}';
  }
}
