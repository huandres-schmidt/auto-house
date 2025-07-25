class DbConstants {
  static const int version = 1;
  static const String path = 'assets/sql';
  static const String dbName = 'autohouse.db';
  static const String create = '$path/create.sql';
  static const String pathUpgrade = '$path/upgrade/script_upgrade_';
}

class TableName {
  static const String veiculo = 'VEICULO';
  static const String manutencao = 'MANUTENCAO';
}