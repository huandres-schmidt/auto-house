class ValidarPlaca {
  static bool validarPlaca(String placa) {
    if (placa.isEmpty) {
      return false;
    }

    // Verifica se a placa tem o formato correto
    final regex = RegExp(r'^([A-Z]{3}-[0-9]{4}|[A-Z]{3}[0-9][A-Z][0-9]{2})$');
    if (!regex.hasMatch(placa)) {
      return false;
    }

    return true;
  }
}
