import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/presentation/historico/bloc/historico_bloc.dart';

class HistoricoContent extends StatelessWidget {
  const HistoricoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HistoricoBloc, HistoricoState>(
        builder: (context, state) {
          if (state is HistoricoLoaded) {
            return ListView.builder(
              itemCount: state.manutencoes.length,
              itemBuilder: (context, index) {
                final manutencao = state.manutencoes[index];
                return ListTile(
                  title: Text(manutencao?.tipo ?? ''),
                );
              },
            );
          }

          return const Center();
        },
      ),
    );
  }
}
