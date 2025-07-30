import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pratica/core/constants/colors_contants.dart';
import 'package:pratica/core/enum/marcas.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/presentation/adicionar_veiculo/bloc/adicionar_veiculo_bloc.dart';

import '../../../core/constants/assets_contants.dart';
import '../../../core/enum/modelo.dart';
import '../../../core/utils/upper_case_text_formatter.dart';
import '../../../core/utils/validar_placa.dart';
import 'adicionar_veiculo_button.dart';
import 'adicionar_veiculo_text.dart';

class AdicionarVeiculoForm extends StatefulWidget {
  const AdicionarVeiculoForm({super.key});

  @override
  State<AdicionarVeiculoForm> createState() => _AdicionarVeiculoFormState();
}

class _AdicionarVeiculoFormState extends State<AdicionarVeiculoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _placa = TextEditingController();

  final TextEditingController _quilometragem = TextEditingController();

  final TextEditingController _ano = TextEditingController();

  Marcas? _marca;
  dynamic _modeloSelecionado;

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
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              marca.asset,
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(marca.nome),
                          ],
                        ),
                      );
                    }).toList(),
                onChanged: (novaMarca) {
                  setState(() {
                    _marca = novaMarca;
                  });
                },
              ),
              const SizedBox(height: 10),
              DropdownButton<dynamic>(
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
                value: _modeloSelecionado,
                hint: const Text("Escolha um modelo"),
                isExpanded: true,
                items:
                    getModelosByMarca(_marca).map<DropdownMenuItem<dynamic>>((
                      modelo,
                    ) {
                      return DropdownMenuItem<dynamic>(
                        value: modelo,
                        child: Text(modelo.modelo),
                      );
                    }).toList(),
                onChanged: (novoModelo) {
                  setState(() {
                    _modeloSelecionado = novoModelo;
                  });
                },
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                keyboardType: TextInputType.text,
                inputFormatters: [UpperCaseTextFormatter()],
                controller: _placa,
                validator: (value) => _onAdicionarValidarPlaca(value),
                assetsConstants: AssetsConstants.iconPlaca,
                hintText: "Placa",
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                keyboardType: TextInputType.number,
                inputFormatters: [MaskTextInputFormatter(mask: '###.###')],
                controller: _quilometragem,
                validator: (value) => _onAdicionarValidarQuilometragem(value),
                assetsConstants: AssetsConstants.iconMotor,
                hintText: "Quilometragem",
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                keyboardType: TextInputType.number,
                inputFormatters: [MaskTextInputFormatter(mask: '####')],
                controller: _ano,
                validator: (value) => _onAdicionarValidarAno(value),
                assetsConstants: AssetsConstants.iconAno,
                hintText: "Ano de Fabricação",
              ),
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

  List<dynamic> getModelosByMarca(Marcas? marca) {
    switch (marca) {
      case Marcas.chevrolet:
        return ModeloChevrolet.values;
      case Marcas.volkswagen:
        return ModeloVolkswagen.values;
      case Marcas.fiat:
        return ModeloFiat.values;
      case Marcas.hyundai:
        return ModeloHyundai.values;
      case Marcas.renault:
        return ModeloRenault.values;
      case Marcas.honda:
        return ModeloHonda.values;
      case Marcas.ford:
        return ModeloFord.values;
      case Marcas.jeep:
        return ModeloJeep.values;
      case Marcas.peugeot:
        return ModeloPeugeot.values;
      case Marcas.toyota:
        return ModeloToyota.values;
      default:
        return [];
    }
  }

  String? _onAdicionarValidarPlaca(String? value) {
    if (value == null || value.isEmpty) {
      return 'Placa é obrigatório';
    }
    if (!ValidarPlaca.validarPlaca(value)) {
      return 'Placa inválida';
    }
    return null;
  }

  String? _onAdicionarValidarQuilometragem(String? value) {
    if (value == null || value.isEmpty) {
      return 'Quilometragem é obrigatório';
    }
    return null;
  }

  String? _onAdicionarValidarAno(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ano é obrigatório';
    }
    return null;
  }

  void _onAdicionarVeiculoSubmit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final placa = _placa.text;
      final quilometragem = _quilometragem.text;
      final ano = _ano.text;

      VeiculoModel veiculo = VeiculoModel(
        modelo: _modeloSelecionado?.modelo,
        placa: placa,
        quilometragem: quilometragem,
        ano: int.parse(ano),
        marca: _marca,
      );

      context.read<AdicionarVeiculoBloc>().add(
        AdicionarVeiculoAdd(veiculo: veiculo),
      );
    }
  }
}
