enum Marcas {
  chevrolet('Chevrolet', 'assets/images/marca/chevrolet.svg'),
  volkswagen('Volkswagen', 'assets/images/marca/volkswagen.svg'),
  fiat('Fiat', 'assets/images/marca/fiat.svg'),
  toyota('Toyota', 'assets/images/marca/toyota.svg'),
  hyundai('Hyundai', 'assets/images/marca/hyundai.svg'),
  renault('Renault', 'assets/images/marca/renault.svg'),
  honda('Honda', 'assets/images/marca/honda.svg'),
  ford('Ford', 'assets/images/marca/ford.svg'),
  jeep('Jeep', 'assets/images/marca/jeep.svg'),
  peugeot('Peugeot', 'assets/images/marca/peugeot.svg');

  const Marcas(this.nome, this.asset);
  final String nome;
  final String asset;
}