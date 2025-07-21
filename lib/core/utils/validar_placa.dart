class ValidarPlaca {
  static bool validarPlaca(String placa) {
    if (placa.isEmpty) {
      return false;
    }

    if (placa.length != 7) {
      return false;
    }

    return true;
  }
}
