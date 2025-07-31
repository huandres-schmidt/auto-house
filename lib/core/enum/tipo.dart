import 'package:flutter/material.dart';

enum Tipo {
  manutencaoPreventiva(
    'Manutenção Preventiva',
    'assets/images/icon/manutencao_preventiva.png',
    Colors.green,
  ),
  manutencaoCorretiva(
    'Manutenção Corretiva',
    'assets/images/icon/manutencao_corretiva.png',
    Colors.red,
  );

  const Tipo(this.tipo, this.asset, this.color);

  final String tipo;
  final String asset;
  final Color color;
}
