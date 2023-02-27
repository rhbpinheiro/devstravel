import 'package:flutter/material.dart';

Drawer customDrawer({BuildContext? pageContext}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("DevsTravel",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue',
                    fontSize: 22,
                  )),
              Text(
                "versão 1.0",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Helvetica Neue',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/home');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.public,
            color: Colors.black,
          ),
          title: const Text(
            "Escolher Continente",
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/continent');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: const Text(
            "Buscar Cidade",
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/search');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: const Text(
            "Cidades Salvas",
            style: TextStyle(
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/favorites');
          },
        ),
      ],
    ),
  );
}
