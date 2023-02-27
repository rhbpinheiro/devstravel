import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/widgets/customappbar.dart';
import 'package:devstravel/src/widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue',
    );
    return Consumer<AppData>(
      builder: (context, appdata, child) => Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: customAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Pagina Home',
        ),
        drawer: customDrawer(
          pageContext: context,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Bem vindo(a) ao',
                  style: style,
                ),
              ),
              Image.asset(
                'lib/assets/images/flutter1_devstravel_logo.png',
                width: 200,
              ),
              Container(
                margin: const EdgeInsets.all(30),
                child: Text(
                  'Seu guia de viagem perfeito',
                  style: style,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
