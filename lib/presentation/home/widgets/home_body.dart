import 'package:autohouse/presentation/home/widgets/home_versao.dart';
import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';
import 'home_button.dart';
import 'home_card_veiculo.dart';
import 'home_seus_veiculos.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: HomeTitle(text: 'Bem-vindo ${state.nome}')),
            const SizedBox(height: 5.0),
            const HomeButton(),
            const SizedBox(height: 20.0),
            const HomeTitle(text: 'Seus Veículos'),
            const SizedBox(height: 5.0),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: HomeCardVeiculo(state: state),
            ),
            const SizedBox(height: 5.0),
            const HomeVersao(),
          ],
        ),
      ),
    );
  }
}
