import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/core/enum/marcas.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_ano.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_cor.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_modelo.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_placa.dart';
import 'package:pratica/presentation/adicionar_veiculo/widgets/adicionar_veiculo_form_quilometragem.dart';

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

  final TextEditingController _cor = TextEditingController();

  Marcas? _marca;

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Selecione a marca do veículo:'),
                  const SizedBox(height: 10),
                  DropdownButton<Marcas>(
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
                  const SizedBox(height: 20),
                  if (_marca != null)
                    Text(
                      'Marca selecionada: ${_marca?.nome}',
                      style: const TextStyle(fontSize: 16),
                    ),
                ],
              ),
              AdicionarVeiculoFormPlaca(controller: _placa),
              const SizedBox(height: 10),
              AdicionarVeiculoFormModelo(controller: _modelo),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              AdicionarVeiculoFormQuilometragem(controller: _quilometragem),
              const SizedBox(height: 10),
              AdicionarVeiculoFormAno(controller: _ano),
              const SizedBox(height: 10),
              AdicionarVeiculoFormCor(controller: _cor),
              const SizedBox(height: 10),
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
      final cor = _cor.text;

      print('marca: $_marca');

      VeiculoModel veiculo = VeiculoModel(
        modelo: modelo,
        placa: placa,
        quilometragem: quilometragem,
        ano: int.parse(ano),
        cor: cor,
        marca: _marca,
      );

      context.read<AdicionarVeiculoBloc>().add(
        AdicionarVeiculoAdd(veiculo: veiculo),
      );
    }
  }
}
