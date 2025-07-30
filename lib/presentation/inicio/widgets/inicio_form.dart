import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_event.dart';
import 'inicio_button.dart';
import 'inicio_campo_nome.dart';
import 'inicio_logo.dart';

class InicioForm extends StatelessWidget {
  const InicioForm({super.key, required this.controller, required this.form});

  final TextEditingController controller;
  final GlobalKey<FormState> form;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          const InicioLogo(),
          InicioCampoNome(controller: controller),
          InicioButton(onPressed: () => _onInicioSubmit(context)),
        ],
      ),
    );
  }

  void _onInicioSubmit(BuildContext context) {
    if (form.currentState?.validate() ?? false) {
      final name = controller.text;

      context.read<AuthBloc>().add(AuthNameSubmitted(name));
    }
  }
}
