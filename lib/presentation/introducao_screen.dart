import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../config/routes.dart';
import '../core/constants/assets_contants.dart';
import '../core/constants/colors_contants.dart';
import '../core/constants/font_contants.dart';

class IntroducaoScreen extends StatelessWidget {
  const IntroducaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      animationDuration: 350,
      pages: [
        PageViewModel(
          decoration: PageDecoration(
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
          ),
          title: "Bem-vindo ao AutoHouse",
          body: "Gerencie suas manutenções de veículos com facilidade.",
          image: Center(
            child: Image.asset(
              AssetsConstants.logoHorizontal,
              width: 350,
              color: ColorsConstants.intotheGreen,
            ),
          ),
        ),
        PageViewModel(
          decoration: PageDecoration(
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
          ),
          title: "Adicione seus veículos",
          body: "Mantenha o controle de todas as manutenções realizadas.",
          image: Center(
            child: Image.asset(
              AssetsConstants.logoHorizontal,
              width: 350,
              color: ColorsConstants.intotheGreen,
            ),
          ),
        ),
        PageViewModel(
          decoration: PageDecoration(
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
          ),
          title: "Acompanhe o histórico",
          body:
              "Visualize o histórico de manutenções e fique por dentro do estado do seu veículo.",
          image: Center(
            child: Image.asset(
              AssetsConstants.logoHorizontal,
              width: 350,
              color: ColorsConstants.intotheGreen,
            ),
          ),
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
            child: Image.asset(
              AssetsConstants.homenagem,
              width: 350,
            ),
          ),
        ),
      ],
      onDone: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.inicio.route);
      },
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
    );
  }
}
