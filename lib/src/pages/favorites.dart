import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/widgets/citybox.dart';
import 'package:devstravel/src/widgets/customappbar.dart';
import 'package:devstravel/src/widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue',
    );
    return Consumer<AppData>(builder: (context, appdata, child) {
      List favorites = appdata.favoritesCities();
      return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: customAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Cidades Salvas',
        ),
        drawer: customDrawer(
          pageContext: context,
        ),
        body: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  favorites.length,
                  (index) {
                    return CityBox(
                      data: favorites[index],
                      onTap: (cityData) {
                        Navigator.pushNamed(context, '/city',
                            arguments: cityData);
                      },
                    );
                  },
                ),
              ),
      );
    });
  }
}
