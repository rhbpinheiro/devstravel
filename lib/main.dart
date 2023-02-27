import 'package:devstravel/src/pages/city.dart';
import 'package:devstravel/src/pages/continent.dart';
import 'package:devstravel/src/pages/favorites.dart';
import 'package:devstravel/src/pages/listcity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/models/appdata.dart';
import 'src/pages/home.dart';
import 'src/pages/preload.dart';
import 'src/pages/search.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => AppData())],
        child: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/preload': (context) => const PreloadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/listcity': (context) => ListCityPage(),
        '/city': (context) => CityPage(),
        '/favorites': (context) => FavoritesPage(),
      },
      initialRoute: '/preload',
    );
  }
}
