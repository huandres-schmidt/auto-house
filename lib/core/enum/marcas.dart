enum Marcas {
  chevrolet('Chevrolet', 'assets/logos/chevrolet.svg'),
  volkswagen('Volkswagen', 'assets/logos/volkswagen.svg'),
  fiat('Fiat', 'assets/logos/fiat.svg'),
  toyota('Toyota', 'assets/logos/toyota.svg'),
  hyundai('Hyundai', 'assets/logos/hyundai.svg'),
  renault('Renault', 'assets/logos/renault.svg'),
  honda('Honda', 'assets/logos/honda.svg'),
  ford('Ford', 'assets/logos/ford.svg'),
  jeep('Jeep', 'assets/logos/jeep.svg'),
  peugeot('Peugeot', 'assets/logos/peugeot.svg');

  const Marcas(this.nome, this.asset);
  final String nome;
  final String asset;
}