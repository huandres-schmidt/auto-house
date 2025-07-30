import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pratica/config/routes.dart';
import 'package:pratica/core/constants/colors_contants.dart';
import 'package:pratica/core/constants/font_contants.dart';
import 'package:pratica/data/models/veiculo_model.dart';
import 'package:pratica/injector.dart';
import 'package:pratica/presentation/components/elevated_button_icon.dart';
import 'package:pratica/presentation/historico/bloc/historico_bloc.dart';

class HistoricoBody extends StatelessWidget {
  const HistoricoBody({super.key, required this.veiculo, required this.state});

  final VeiculoModel veiculo;
  final HistoricoState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            veiculo.modelo!,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: FontConstants.inter,
            ),
          ),
          subtitle: Text(
            'Placa: ${veiculo.placa}\n'
            'Ano: ${veiculo.ano}\n',
            style: TextStyle(fontSize: 16, fontFamily: FontConstants.inter),
          ),
          trailing: SvgPicture.asset(veiculo.marca!.asset, height: 80),
        ),
        Text(
          'Histórico de Manutenções',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorsConstants.intotheGreen,
          ),
        ),
        const Divider(indent: 20.0, endIndent: 20.0),
        state.manutencoes.isEmpty
            ? const Center(
              child: Text(
                'Nenhuma manutenção registrada.',
                style: TextStyle(fontSize: 18),
              ),
            )
            : SizedBox(
              height: 500,
              child: ListView.separated(
                itemCount: state.manutencoes.length,
                separatorBuilder: (context, index) {
                  return const Divider(indent: 20.0, endIndent: 20.0);
                },
                itemBuilder: (context, index) {
                  final manutencao = state.manutencoes[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 5.0,
                    ),
                    child: Card(
                      color: ColorsConstants.whiteSolid,
                      child: ListTile(
                        title: Text(
                          manutencao!.tipo!.tipo,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: FontConstants.inter,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Km: ${manutencao.quilometragem}\n'
                          'Data: ${manutencao.data}\n'
                          'Valor: R\$ ${manutencao.valor?.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontConstants.inter,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 28.0),
          child: ElevatedButtonIcon(
            label: 'Adicionar Manutenção',
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.adicionarManutencao.route,
                arguments: veiculo,
              ).then((value) {
                getIt.get<HistoricoBloc>().add(HistoricoLoad(veiculo.id!));
              });
            },
          ),
        ),
      ],
    );
  }
}
