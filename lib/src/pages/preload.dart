// ignore_for_file: use_build_context_synchronously

import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PreloadPage extends StatefulWidget {
  const PreloadPage({Key? key}) : super(key: key);

  @override
  State<PreloadPage> createState() => _PreloadPageState();
}

class _PreloadPageState extends State<PreloadPage> {
  bool loading = true;
  void requestInfo() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      loading = true;
    });
    bool req = await Provider.of<AppData>(context, listen: false).requestData();
    if (req) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/flutter1_devstravel_logo.png',
              width: 200,
            ),
            loading
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(30),
                        child: const Text(
                          'Carregando Imformações...',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ],
                  )
                : Container(),
            !loading
                ? Container(
                    margin: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      onPressed: () {
                        requestInfo();
                      },
                      child: const Text(
                        'Textar Novamente',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
