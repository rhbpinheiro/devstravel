import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/widgets/citybox.dart';
import 'package:devstravel/src/widgets/customappbar.dart';
import 'package:devstravel/src/widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinentPage extends StatelessWidget {
  ContinentPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue',
    );
    void seeCityAction(context, continentIndex) {
      print(continentIndex);
      Navigator.pushNamed(context, '/listcity', arguments: continentIndex);
    }

    void cityBoxAction(pageContext, cityData) {
      Navigator.pushNamed(
        pageContext,
        '/city',
        arguments: cityData,
      );
    }

    return Consumer<AppData>(
      builder: (context, appdata, child) => Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: customAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um continente',
          hideSearch: true,
        ),
        drawer: customDrawer(
          pageContext: context,
        ),
        body: ListView.builder(
          itemCount: appdata.data.length,
          itemBuilder: (context, index) {
            var cities = [];
            for (var country in appdata.data[index]["countries"]) {
              cities.addAll(country['cities']);
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                        "${appdata.data[index]['name']} (${cities.length})",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Ver cidades',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      onPressed: () {
                        seeCityAction(context, index);
                      },
                    )
                  ],
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return CityBox(
                        data: cities[index],
                        onTap: (cityData) {
                          cityBoxAction(context, cityData);
                        },
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
