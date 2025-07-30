import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pratica/presentation/home/bloc/home_bloc.dart';

import '../../../core/constants/assets_contants.dart';
import '../../../core/constants/colors_contants.dart';
import 'home_body.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.whiteSolid,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsConstants.whiteSolid,
        title: Image.asset(
          AssetsConstants.logoHorizontal,
          height: 48,
          color: ColorsConstants.intotheGreen,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: _listener,
        builder: (context, state) {
          return HomeBody(state: state);
        },
      ),
    );
  }

  void _listener(BuildContext context, Object? state) {}
}
