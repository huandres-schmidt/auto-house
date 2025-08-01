enum Marcas {
  chevrolet('Chevrolet', 'assets/images/marca/chevrolet.png'),
  volkswagen('Volkswagen', 'assets/images/marca/volkswagem.png'),
  fiat('Fiat', 'assets/images/marca/fiat.png'),
  toyota('Toyota', 'assets/images/marca/toyota.png'),
  hyundai('Hyundai', 'assets/images/marca/hyundai.png'),
  renault('Renault', 'assets/images/marca/renault.png'),
  honda('Honda', 'assets/images/marca/honda.png'),
  ford('Ford', 'assets/images/marca/ford.png'),
  jeep('Jeep', 'assets/images/marca/jeep.png'),
  peugeot('Peugeot', 'assets/images/marca/peugeot.png');

  const Marcas(this.nome, this.asset);
  final String nome;
  final String asset;
}