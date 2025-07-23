import 'package:flutter/material.dart';
import 'package:pratica/core/constants/colors_contants.dart';
import 'package:pratica/presentation/inicio/widgets/inicio_form.dart';
import 'package:pratica/presentation/inicio/widgets/inicio_versao_app.dart';

class InicioScreen extends StatelessWidget {
  InicioScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nomePessoaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.intotheGreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: minHeight(context)),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InicioForm(controller: nomePessoaController, form: formKey),
                  const Spacer(),
                  const InicioVersaoApp(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double minHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top;
  }
}
