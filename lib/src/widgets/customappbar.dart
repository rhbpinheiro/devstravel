import 'package:flutter/material.dart';

AppBar customAppBar({
  GlobalKey<ScaffoldState>? scaffoldKey,
  BuildContext? pageContext,
  String title = "",
  bool hideSearch = false,
  bool showBack = false,
}) {
  void seachAction() {
    Navigator.pushReplacementNamed(pageContext!, '/search');
  }

  IconButton drawerIcon = IconButton(
    icon: Icon(Icons.menu, color: Colors.black, size: 30),
    onPressed: () {
      scaffoldKey!.currentState!.openDrawer();
    },
  );
  IconButton backIcon = IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
    onPressed: () {
      Navigator.pop(pageContext!);
    },
  );

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: true,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: showBack ? backIcon : drawerIcon,
    actions: [
      !hideSearch
          ? IconButton(
              icon: const Icon(Icons.search, color: Colors.black, size: 30),
              onPressed: seachAction,
            )
          : const SizedBox.shrink(),
    ],
  );
}
