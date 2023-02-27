import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/widgets/citybox.dart';
import 'package:devstravel/src/widgets/customappbar.dart';
import 'package:devstravel/src/widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var list = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  void doSearch(pageContext, text) async {
    var newList =
        await Provider.of<AppData>(pageContext, listen: false).searchCity(text);
    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(
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
          title: 'Busque uma cidade',
          hideSearch: true,
        ),
        drawer: customDrawer(
          pageContext: context,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  doSearch(context, text);
                },
                decoration: InputDecoration(
                  hintText: "Digite o nome de uma cidade",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  list.length,
                  (index) {
                    return CityBox(
                      data: list[index],
                      onTap: (cityData) {
                        Navigator.pushNamed(context, '/city',
                            arguments: cityData);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
