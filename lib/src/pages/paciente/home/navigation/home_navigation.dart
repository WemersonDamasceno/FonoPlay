import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fonoplay/src/constants/constants_colors.dart';
import 'package:fonoplay/src/constants/constants_paginas.dart';
import 'package:fonoplay/src/pages/paciente/home/navigation/controllers/home_controller.dart';
import 'package:fonoplay/src/services/auth-service.dart';
import 'package:provider/provider.dart';

final homeController = HomeController();

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({Key? key}) : super(key: key);

  @override
  _NavigationHomePageState createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  @override
  Widget build(BuildContext context) {
    String withoutProfilePhoto =
        "https://drive.google.com/file/d/1O_xmsLgwLRNBW4daDmRzGW67cRFfOXYK/view?usp=sharing";
    String imageUser = context.watch<AuthServiceNotifier>().user?.photoURL ??
        withoutProfilePhoto;

    return Scaffold(
      body: Observer(
        builder: (_) {
          return homeController.tabs[homeController.tabSelecionada];
        },
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration:
                  const BoxDecoration(gradient: ConstantColor.linearColors),
              accountEmail: Text(
                context.watch<AuthServiceNotifier>().user?.email ??
                    "wemersondamasceno@gmail.com",
                style: TextStyle(fontSize: 12),
              ),
              accountName: Text(
                context.watch<AuthServiceNotifier>().user?.displayName ??
                    "Wemerson Damasceno",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(imageUser),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text("Funcionalidades",
                  style: TextStyle(
                    color: ConstantColor.cinzaTextColor,
                    fontSize: 16,
                  )),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: ConstantColor.startGradiente,
              ),
              title: const Text("Pagina Inicial"),
              onTap: () {
                Navigator.pop(context);
                homeController.trocarTela(ConstantesPaginas.PAGINA_INICIAL);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.auto_stories,
                color: ConstantColor.startGradiente,
              ),
              title: const Text("Artigos para ler"),
              onTap: () {
                Navigator.pop(context);
                homeController.trocarTela(ConstantesPaginas.ARTIGOS_PARA_LER);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: ConstantColor.startGradiente,
              ),
              title: const Text("Dados da crian??a"),
              onTap: () {
                Navigator.pop(context);
                homeController.trocarTela(ConstantesPaginas.PERFIL_DA_CRIANCA);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: ConstantColor.startGradiente,
              ),
              title: const Text("Notifica????es"),
              onTap: () {
                Navigator.pop(context);
                homeController.trocarTela(ConstantesPaginas.NOTIFICACOES);
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text("Outras op????es",
                  style: TextStyle(
                    color: ConstantColor.cinzaTextColor,
                    fontSize: 16,
                  )),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.email_rounded,
                color: ConstantColor.startGradiente,
              ),
              title: const Text("Envie suas sujest??es"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra p??gina
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: ConstantColor.startGradiente,
              ),
              title: const Text("Sobre o FonoPlay"),
              onTap: () {
                Navigator.pop(context);
                //Navegar para outra p??gina
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: ConstantColor.startGradiente,
              ),
              title: const Text("Sair"),
              onTap: () async {
                await Provider.of<AuthServiceNotifier>(context, listen: false)
                    .logout(context: context);
                Navigator.of(context).pushReplacementNamed('/login_entrar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
