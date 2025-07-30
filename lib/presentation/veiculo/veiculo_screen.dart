import 'package:autohouse/presentation/veiculo/bloc/veiculo_bloc.dart';
import 'package:autohouse/presentation/veiculo/widget/veiculo_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VeiculoScreen extends StatelessWidget {
  const VeiculoScreen({super.key, required this.veiculoBloc});

  final VeiculoBloc veiculoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VeiculoBloc>.value(
      value: veiculoBloc..add(const VeiculoLoad()),
      child: const VeiculoContent(),
    );
  }
}
