import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/domain/repositories/local/veiculo_local_repository.dart';

class VeiculoController {
  final VeiculoLocalRepository veiculoLocalRepository;

  VeiculoController(this.veiculoLocalRepository);

  Future<void> insert(VeiculoModel veiculo) async {
    await veiculoLocalRepository.adicionar(veiculo);
  }

  Future<List<VeiculoModel?>> getAll() async {
    return await veiculoLocalRepository.buscarTodos();
  }

  Future<void> isVeiculoExist(String placa) async {
    final veiculos = await veiculoLocalRepository.buscarTodos();
    veiculos.any((veiculo) {
      if(veiculo?.placa == placa) {
        throw Exception('Veículo com placa $placa já existe.');
      }
      return false;
    });
  }
}