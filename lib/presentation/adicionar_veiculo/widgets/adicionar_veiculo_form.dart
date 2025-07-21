import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/core/constants/colors_contants.dart';
import 'package:pratica/core/enum/marcas.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_ano.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_modelo.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_placa.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_quilometragem.dart';

import '../../../core/enum/cores.dart';
import 'adicionar_veiculo_button.dart';

class AdicionarVeiculoForm extends StatefulWidget {
  const AdicionarVeiculoForm({super.key});

  @override
  State<AdicionarVeiculoForm> createState() => _AdicionarVeiculoFormState();
}

class _AdicionarVeiculoFormState extends State<AdicionarVeiculoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _modelo = TextEditingController();

  final TextEditingController _placa = TextEditingController();

  final TextEditingController _quilometragem = TextEditingController();

  final TextEditingController _ano = TextEditingController();

  Marcas? _marca;
  Cores? _cor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AdicionarVeiculoFormPlaca(controller: _placa),
              const SizedBox(height: 10),
              AdicionarVeiculoFormModelo(controller: _modelo),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              AdicionarVeiculoFormQuilometragem(controller: _quilometragem),
              const SizedBox(height: 10),
              AdicionarVeiculoFormAno(controller: _ano),
              const SizedBox(height: 10),
              DropdownButton<Marcas>(
                style: const TextStyle(
                  color: ColorsConstants.intotheGreen,
                  fontWeight: FontWeight.w500,
                ),
                icon: const Icon(Icons.arrow_downward_sharp),
                dropdownColor: ColorsConstants.whiteEdgar,
                iconEnabledColor: ColorsConstants.intotheGreen,
                iconDisabledColor: ColorsConstants.intotheGreen,
                menuWidth: 250,
                underline: Container(
                  height: 1.5,
                  color: ColorsConstants.intotheGreen,
                ),
                value: _marca,
                hint: const Text("Escolha uma marca"),
                isExpanded: true,
                items:
                    Marcas.values.map((marca) {
                      return DropdownMenuItem<Marcas>(
                        value: marca,
                        child: Text(marca.nome),
                      );
                    }).toList(),
                onChanged: (novaMarca) {
                  setState(() {
                    _marca = novaMarca;
                  });
                },
              ),
              const SizedBox(height: 10),
              DropdownButton<Cores>(
                style: const TextStyle(
                  color: ColorsConstants.intotheGreen,
                  fontWeight: FontWeight.w500,
                ),
                icon: const Icon(Icons.arrow_downward_sharp),
                dropdownColor: ColorsConstants.whiteEdgar,
                iconEnabledColor: ColorsConstants.intotheGreen,
                iconDisabledColor: ColorsConstants.intotheGreen,
                menuWidth: 250,
                underline: Container(
                  height: 1.5,
                  color: ColorsConstants.intotheGreen,
                ),
                value: _cor,
                hint: const Text("Escolha uma cor"),
                isExpanded: true,
                items:
                    Cores.values.map((cores) {
                      return DropdownMenuItem<Cores>(
                        value: cores,
                        child: Text(cores.nome),
                      );
                    }).toList(),
                onChanged: (novaCor) {
                  setState(() {
                    _cor = novaCor;
                  });
                },
              ),
              const Spacer(),
              AdicionarVeiculoButton(
                onPressed: () => _onAdicionarVeiculoSubmit(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAdicionarVeiculoSubmit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final modelo = _modelo.text;
      final placa = _placa.text;
      final quilometragem = _quilometragem.text;
      final ano = _ano.text;

      VeiculoModel veiculo = VeiculoModel(
        modelo: modelo,
        placa: placa,
        quilometragem: quilometragem,
        ano: int.parse(ano),
        cor: _cor,
        marca: _marca,
      );

      context.read<AdicionarVeiculoBloc>().add(
        AdicionarVeiculoAdd(veiculo: veiculo),
      );
    }
  }
}
