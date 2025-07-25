import '../../core/resources/base_model.dart';

class ManutencaoModel extends BaseModel {
  final int? id;
  final int? veiculoId;
  final String? tipo;
  final String? nomePeca;
  final String? marca;
  final String? quilometragem;
  final String? data;
  final double? valor;
  final String? observacao;

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
  });

  factory ManutencaoModel.fromJson(Map<String, dynamic> json) {
    return ManutencaoModel(
      id: json['id'] as int?,
      veiculoId: json['veiculoId'] as int?,
      tipo: json['tipo'] as String?,
      nomePeca: json['nomePeca'] as String?,
      marca: json['marca'] as String?,
      quilometragem: json['quilometragem'] as String?,
      data: json['data'] as String?,
      valor: (json['valor'] as num?)?.toDouble(),
      observacao: json['observacao'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'veiculoId': veiculoId,
      'tipo': tipo,
      'nomePeca': nomePeca,
      'marca': marca,
      'quilometragem': quilometragem,
      'data': data,
      'valor': valor,
      'observacao': observacao,
    };
  }

  @override
  String toString() {
    return 'ManutencaoModel{'
        'id: $id, '
        'veiculoId: $veiculoId,'
        ' tipo: $tipo,'
        ' nomePeca: $nomePeca, '
        'marca: $marca,'
        ' quilometragem: $quilometragem, '
        'data: $data, '
        'valor: $valor,'
        ' observacao: $observacao,'
        '}';
  }
}
