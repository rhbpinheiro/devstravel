import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/widgets/citybox.dart';
import 'package:devstravel/src/widgets/customappbar.dart';
import 'package:devstravel/src/widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCityPage extends StatelessWidget {
  ListCityPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue',
    );
    //usando o pageContext para passar o contexto da pagina 
    void cityBoxAction(pageContext, cityData) {
      Navigator.pushNamed(pageContext, '/city', arguments: cityData);
    }
    //recebendo os argumentos

    Object? args = ModalRoute.of(context)!.settings.arguments;
    final int continentIndex = args as int;

    return Consumer<AppData>(builder: (context, appdata, child) {
      //Criando o array com as cidades
      var cities = [];
      for (var country in appdata.data[continentIndex]['countries']) {
        cities.addAll(country['cities']);
      }
      return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: customAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title:
              '${appdata.data[continentIndex]['name']} (${cities.length} cidades)',
          showBack: true,
        ),
        drawer: customDrawer(
          pageContext: context,
        ),
        body: Center(
            child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
            cities.length,
            (index) {
              return CityBox(
                data: cities[index],
                onTap: (cityData) {
                  cityBoxAction(context, cityData);
                },
              );
            },
          ),
        )),
      );
    });
  }
}
