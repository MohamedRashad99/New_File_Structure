import 'package:flutter/material.dart';
import 'package:queen_file_structure/generated/assets.dart';
import 'package:queen_themes/queen_theme.dart';

import 'config/theme.dart';
import 'generated/tr.dart';

Future<void> main() async {
  await Nations.boot();

  await QTheme.boot(ThemeConfig());
  runApp(QThemeBuilder(builder: (context, _) {
    return NationsBuilder(builder: (context) {
      return const MyApp();
    });
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Nations.locale,
      localizationsDelegates: Nations.delegates,
      supportedLocales: Nations.supportedLocales,
      title: 'Flutter Demo',
      theme: QTheme.current,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    QTheme.next();
    // final lang = Nations.locale.languageCode;
    // if (lang == 'ar') {
    //   Nations.updateLocale(const Locale('en'));
    // } else {
    //   Nations.updateLocale(const Locale('ar'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Nations.locale.toString()),
            Text(Tr.alreadyHaveAnAccount.tr),
            Image.asset(
              Assets.images.logos.medo,
              height: 50,
              width: 150,
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              Assets.images.logos.memo,
              height: 50,
              width: 150,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
