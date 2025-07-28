import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/adicionar_manutencao/bloc/adicionar_manutencao_bloc.dart';
import 'package:pratica/presentation/adicionar_manutencao/widget/adicionar_manutencao_content.dart';

class AdicionarManutencaoScreen extends StatefulWidget {
  const AdicionarManutencaoScreen({
    super.key,
    required this.adicionarManutencaoBloc,
    required this.veiculo,
  });

  final AdicionarManutencaoBloc adicionarManutencaoBloc;
  final VeiculoModel veiculo;

  @override
  State<AdicionarManutencaoScreen> createState() =>
      _AdicionarManutencaoScreenState();
}

class _AdicionarManutencaoScreenState extends State<AdicionarManutencaoScreen> {
  late final AdicionarManutencaoBloc _adicionarManutencaoBloc;

  @override
  void initState() {
    _adicionarManutencaoBloc = widget.adicionarManutencaoBloc;
    super.initState();
    _adicionarManutencaoBloc.add(const AdicionarManutencaoLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _adicionarManutencaoBloc,
      child: AdicionarManutencaoContent(veiculo: widget.veiculo),
    );
  }
}
