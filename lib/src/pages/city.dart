import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  bool heart = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void backButtonAction(pageContext) {
    Navigator.pop(pageContext);
  }

  @override
  Widget build(BuildContext context) {
    Object? args = ModalRoute.of(context)!.settings.arguments;
    Map<String, dynamic> cityData = args as Map<String, dynamic>;

    print(cityData['name']);
    TextStyle style = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Helvetica Neue',
    );
    //altura do status bar
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final footerHeight = MediaQuery.of(context).padding.bottom;

    //lógica para marcar as estrelas
    //cityData['review'] é uma string, transforma em double e arredonda p baixo com o floor()
    var starRate = double.parse(cityData['review']).floor();

    List<bool> stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }

    return Consumer<AppData>(
      builder: (context, appdata, child) {
        heart = appdata.hasFavorite(cityData['name']);
        return Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          drawer: customDrawer(
            pageContext: context,
          ),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 250,
                child: Image.network(cityData['places'][0]['img'],
                    fit: BoxFit.cover),
              ),
              ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 200),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cityData['name'],
                                    style: style.copyWith(fontSize: 19),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: stars[0]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 24),
                                      Icon(Icons.star,
                                          color: stars[1]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 24),
                                      Icon(Icons.star,
                                          color: stars[2]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 24),
                                      Icon(Icons.star,
                                          color: stars[3]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 24),
                                      Icon(Icons.star,
                                          color: stars[4]
                                              ? Colors.blue
                                              : Colors.grey,
                                          size: 24),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            cityData['review'],
                                            style: style.copyWith(
                                                fontSize: 11,
                                                color: Colors.blue),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  heart
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      heart =
                                          appdata.favorite(cityData['name']);
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 10.0, right: 10.0, bottom: 10.0),
                          child: Text(
                            cityData['description'],
                            style: style.copyWith(
                                color: Colors.grey, fontSize: 11),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                            'PRINCIPAIS PONTOS TURÍSTICOS',
                            style: style.copyWith(fontSize: 12),
                          ),
                        ),
                        GridView.count(
                          padding: EdgeInsets.only(bottom: footerHeight),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 10 / 11,
                          children: List.generate(
                            cityData['places'].length,
                            (index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            cityData['places'][index]['img'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        cityData['places'][index]['name'],
                                        style: style.copyWith(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        bottom: 15,
                                      ),
                                      child: Text(
                                        'Ponto Turístico',
                                        style: style.copyWith(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: statusBarHeight),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    backButtonAction(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
