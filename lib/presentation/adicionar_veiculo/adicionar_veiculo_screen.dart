import 'package:autohouse/presentation/adicionar_veiculo/widgets/adicionar_veiculo_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/adicionar_veiculo_bloc.dart';

class AdicionarScreen extends StatefulWidget {
  const AdicionarScreen({super.key, required this.adicionarVeiculoBloc});

  final AdicionarVeiculoBloc adicionarVeiculoBloc;

  @override
  State<AdicionarScreen> createState() => _AdicionarScreenState();
}

class _AdicionarScreenState extends State<AdicionarScreen> {

  @override
  void initState() {
    super.initState();
    widget.adicionarVeiculoBloc.add(const AdicionarVeiculoLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.adicionarVeiculoBloc,
      child: const AdicionarVeiculoContent(),
    );
  }
}
