import 'package:flutter/material.dart';

enum Cores {
  vermelho('vermelho', Colors.red),
  verde('verde', Colors.green),
  azul('azul', Colors.blue),
  amarelo('amarelo', Colors.yellow),
  laranja('aaranja', Colors.orange),
  prata('cinza', Colors.grey),
  preto('preto', Colors.black),
  branco('branco', Colors.white);

  const Cores(this.nome, this.cor);
  final String nome;
  final Color cor;
}