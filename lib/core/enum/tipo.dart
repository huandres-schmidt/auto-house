enum Tipo {
  manutencaoPreventiva('Manutenção Preventiva', ''),
  manutencaoCorretiva('Manutenção Corretiva', '');

  const Tipo(this.tipo, this.asset);
  final String tipo;
  final String asset;
}