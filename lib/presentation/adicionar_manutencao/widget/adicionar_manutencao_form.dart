import 'package:autohouse/core/utils/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/constants/assets_contants.dart';
import '../../../core/constants/colors_contants.dart';
import '../../../core/enum/tipo.dart';
import '../../../data/models/manutencao_model.dart';
import '../../../data/models/veiculo_model.dart';
import '../../adicionar_veiculo/widgets/adicionar_veiculo_text.dart';
import '../bloc/adicionar_manutencao_bloc.dart';
import 'adicionar_manutencao_button.dart';

class AdicionarManutencaoForm extends StatefulWidget {
  const AdicionarManutencaoForm({super.key, required this.veiculo});

  final VeiculoModel veiculo;

  @override
  State<AdicionarManutencaoForm> createState() =>
      _AdicionarManutencaoFormState();
}

class _AdicionarManutencaoFormState extends State<AdicionarManutencaoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _peca = TextEditingController();
  final TextEditingController _marca = TextEditingController();
  final TextEditingController _quilometragem = TextEditingController();
  final TextEditingController _valor = TextEditingController();
  final TextEditingController _observacao = TextEditingController();
  final TextEditingController _data = TextEditingController();

  Tipo? _tipo;

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
              DropdownButton<Tipo>(
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
                value: _tipo,
                hint: const Text("Escolha o tipo de manutenção realizada"),
                isExpanded: true,
                items:
                    Tipo.values.map((tipo) {
                      return DropdownMenuItem<Tipo>(
                        value: tipo,
                        child: Text(tipo.tipo),
                      );
                    }).toList(),
                onChanged: (novaTipo) {
                  setState(() {
                    _tipo = novaTipo;
                  });
                },
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _peca,
                validator: (value) => _onValidarCampos(value),
                hintText: 'Peça Substituída',
                assetsConstants: AssetsConstants.iconPeca,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _marca,
                validator: (value) => _onValidarCampos(value),
                hintText: 'Marca da Peça',
                assetsConstants: AssetsConstants.iconMarca,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: [MaskTextInputFormatter(mask: '###.###')],
                keyboardType: TextInputType.number,
                controller: _quilometragem,
                validator: (value) => _onValidarCampos(value),
                hintText: 'Quilometragem',
                assetsConstants: AssetsConstants.iconQuilometragem,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.number,
                controller: _valor,
                validator: (value) => _onValidarCampos(value),
                hintText: 'Valor',
                icon: Icons.attach_money,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: [MaskTextInputFormatter(mask: '##/##/####')],
                keyboardType: TextInputType.number,
                controller: _data,
                validator: (value) => null,
                hintText: 'Data',
                assetsConstants: AssetsConstants.iconAno,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _observacao,
                validator: (value) => null,
                hintText: 'Observação',
                icon: Icons.warning_amber,
              ),
              const Spacer(),
              AdicionarManutencaoButton(
                onPressed: () => _onAdicionarVeiculoSubmit(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _onValidarCampos(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo é obrigatório';
    }
    return null;
  }

  void _onAdicionarVeiculoSubmit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final tipo = _tipo;
      final peca = _peca.text;
      final marca = _marca.text;
      final quilometragem = _quilometragem.text;
      final valor = _valor.text;

      if (_data.text.isEmpty) {
        _data.text = DateTime.now().toIso8601String().formataData();
      }

      if (_observacao.text.isEmpty) {
        _observacao.text = 'Nenhuma observação';
      }

      ManutencaoModel manutencao = ManutencaoModel(
        tipo: tipo,
        veiculoId: widget.veiculo.id,
        nomePeca: peca,
        marca: marca,
        quilometragem: quilometragem,
        data: _data.text,
        valor: double.tryParse(valor),
        observacao: _observacao.text,
      );

      context.read<AdicionarManutencaoBloc>().add(
        AdicionarManutencaoAdd(manutencao: manutencao),
      );
    }
  }
}
