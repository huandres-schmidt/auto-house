import 'package:flutter/material.dart';
import 'package:pratica/presentation/home/widgets/home_button.dart';
import 'package:pratica/presentation/home/widgets/home_card_veiculo.dart';
import 'package:pratica/presentation/home/widgets/home_seus_veiculos.dart';

import '../bloc/home_bloc.dart';
import 'home_card_manutencao.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeButton(),
          const SizedBox(height: 20.0),
          const HomeTitle(text: 'Seus Veículos'),
          SizedBox(height: 150.0, child: HomeCardVeiculo(state: state)),
          const Divider(),
          const HomeTitle(text: 'Histórico de Manutenção'),
          const HomeCardManutencao(),
        ],
      ),
    );
  }
}
