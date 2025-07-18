import 'package:flutter/material.dart';

import '../../../core/constants/colors_contants.dart';

class HomeCardManutencao extends StatelessWidget {
  const HomeCardManutencao({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsConstants.whiteEdgar,
      child: ListTile(
        leading: const Icon(Icons.history, size: 30),
        title: const Text('Manutenção do Veículo X'),
        subtitle: const Text('Data: 01/01/2023'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {},
      ),
    );
  }
}
