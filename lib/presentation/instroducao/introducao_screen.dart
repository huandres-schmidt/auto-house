import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/constants/assets_contants.dart';
import '../../core/constants/colors_contants.dart';
import '../../core/constants/font_contants.dart';
import '../auth/bloc/auth_bloc.dart';
import '../auth/bloc/auth_event.dart';
import 'widget/introducao_campo_nome.dart';

class IntroducaoScreen extends StatelessWidget {
  IntroducaoScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nomePessoaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            decoration: style,
            title: "Bem-vindo ao AutoHouse",
            body: "Gerencie suas manutenções de veículos com facilidade.",
            image: logo,
          ),
          PageViewModel(
            decoration: style,
            title: "Adicione seus veículos",
            body: "Mantenha o controle de todas as manutenções realizadas.",
            image: logo,
          ),
          PageViewModel(
            decoration: style,
            title: "Acompanhe o histórico",
            body: "Visualize o histórico de manutenções e "
                "fique por dentro do estado do seu veículo.",
            image: logo,
          ),
          PageViewModel(
            decoration: PageDecoration(
              bodyTextStyle: TextStyle(
                fontSize: 20.0,
                fontFamily: FontConstants.inter,
              ),
              titleTextStyle: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: FontConstants.inter,
              ),
              boxDecoration: const BoxDecoration(
                color: ColorsConstants.whiteEdgar,
              ),
            ),
            title: "Feliz Dia dos Pais",
            body:
                "Você é meu exemplo de força, sabedoria e simplicidade."
                " Este app é só um gesto para dizer o quanto te admiro\nTe amo pai!",
            image: Center(
              child: Image.asset(AssetsConstants.homenagem, width: 350),
            ),
          ),
          PageViewModel(
            decoration: style,
            title: 'Vamos começar?',
            bodyWidget: Form(
              key: formKey,
              child: IntroducaoCampoNome(controller: nomePessoaController),
            ),
            image: logo,
          ),
        ],
        onDone: () => _onInicioSubmit(context),
        next: const Icon(
          Icons.arrow_forward,
          color: ColorsConstants.intotheGreen,
        ),
        done: const Text(
          "Começar",
          style: TextStyle(color: ColorsConstants.intotheGreen),
        ),
        dotsDecorator: const DotsDecorator(
          activeColor: ColorsConstants.intotheGreen,
          color: Colors.grey,
        ),
        globalBackgroundColor: ColorsConstants.whiteEdgar,
      ),
    );
  }

  void _onInicioSubmit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final name = nomePessoaController.text;

      context.read<AuthBloc>().add(AuthNameSubmitted(name));
    }
  }

  PageDecoration get style {
    return PageDecoration(
      bodyTextStyle: TextStyle(
        fontSize: 20.0,
        color: ColorsConstants.intotheGreen,
        fontFamily: FontConstants.inter,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontFamily: FontConstants.inter,
      ),
      boxDecoration: const BoxDecoration(
        color: ColorsConstants.whiteEdgar,
      ),
    );
  }

  Widget get logo {
    return Center(
      child: Image.asset(
        AssetsConstants.logoHorizontal,
        width: 350,
        color: ColorsConstants.intotheGreen,
      ),
    );
  }
}
