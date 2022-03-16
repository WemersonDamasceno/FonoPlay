import 'package:flutter/material.dart';
import 'package:fonoplay/src/pages/paciente/home/1_inicio/widgets/banner/banner_widget.dart';
import 'package:fonoplay/src/pages/widgets/cabecalho_widget.dart';
import 'package:fonoplay/src/pages/widgets/container_gradiente_widget.dart';

import 'widgets/banner/banner_carousel_widget.dart';

class InicioPacientePage extends StatelessWidget {
  const InicioPacientePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const ContainerGradienteWidget(),
        SafeArea(
          child: Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: size.height * 0.01),
            child: Column(
              children: const [
                CabecalhoWidget(
                  imagemPerfil: "assets/images/avatar_01.png",
                  nomeCrianca: "Joãozinho",
                  titulo: "Pagina Inicial",
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.1,
          right: 0,
          left: 0,
          child: const BannerWidget(),
        ),
      ],
    );
  }
}