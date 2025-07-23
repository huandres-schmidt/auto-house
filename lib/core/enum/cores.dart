import 'package:flutter/material.dart';

enum Cores {
  vermelho('Vermelho', Colors.red),
  verde('Verde', Colors.green),
  azul('Azul', Colors.blue),
  amarelo('Amarelo', Colors.yellow),
  laranja('Laranja', Colors.orange),
  prata('Cinza', Colors.grey),
  preto('Preto', Colors.black),
  branco('Branco', Colors.white);

  const Cores(this.nome, this.cor);
  final String nome;
  final Color cor;
}