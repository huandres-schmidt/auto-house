import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/data/models/manutencao_model.dart';

import '../../../core/constants/assets_contants.dart';
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

  final TextEditingController _tipo = TextEditingController();
  final TextEditingController _peca = TextEditingController();
  final TextEditingController _marca = TextEditingController();
  final TextEditingController _quilometragem = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _valor = TextEditingController();
  final TextEditingController _observacao = TextEditingController();


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
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _tipo,
                validator: (value) => _onAdicionarValidarTipo(value),
                hintText: 'Tipo de Manutenção',
                assetsConstants: AssetsConstants.iconMotor,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _peca,
                validator: (value) => _onAdicionarValidarTipo(value),
                hintText: 'Peça Substituída',
                assetsConstants: AssetsConstants.iconMotor,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _marca,
                validator: (value) => _onAdicionarValidarTipo(value),
                hintText: 'Marca da Peça',
                assetsConstants: AssetsConstants.iconMotor,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _quilometragem,
                validator: (value) => _onAdicionarValidarTipo(value),
                hintText: 'Quilometragem',
                assetsConstants: AssetsConstants.iconMotor,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _data,
                validator: (value) => _onAdicionarValidarTipo(value),
                hintText: 'Data',
                assetsConstants: AssetsConstants.iconMotor,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.number,
                controller: _valor,
                validator: (value) => _onAdicionarValidarTipo(value),
                hintText: 'Valor',
                assetsConstants: AssetsConstants.iconMotor,
              ),
              const SizedBox(height: 10),
              AdicionarVeiculoText(
                inputFormatters: const [],
                keyboardType: TextInputType.text,
                controller: _observacao,
                validator: (value) => _onAdicionarValidarTipo(value),
                hintText: 'Observação',
                assetsConstants: AssetsConstants.iconMotor,
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

  String? _onAdicionarValidarTipo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tipo é obrigatório';
    }
    return null;
  }

  void _onAdicionarVeiculoSubmit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final tipo = _tipo.text;
      final peca = _peca.text;
      final marca = _marca.text;
      final quilometragem = _quilometragem.text;
      final data = _data.text;
      final valor = _valor.text;
      final observacao = _observacao.text;

      ManutencaoModel manutencao = ManutencaoModel(
        tipo: tipo,
        veiculoId: widget.veiculo.id,
        nomePeca: peca,
        marca: marca,
        quilometragem: quilometragem,
        data: data,
        valor: double.tryParse(valor),
        observacao: observacao,
      );

      context.read<AdicionarManutencaoBloc>().add(
        AdicionarManutencaoAdd(manutencao: manutencao),
      );
    }
  }
}
