import 'package:autohouse/presentation/manutencao/widget/manutencao_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/manutencao_bloc.dart';

class ManutencaoScreen extends StatelessWidget {
  const ManutencaoScreen({super.key, required this.manutencaoBloc});

  final ManutencaoBloc manutencaoBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManutencaoBloc>.value(
      value: manutencaoBloc..add(const ManutencaoLoad()),
      child: const ManutencaoContent(),
    );
  }
}
