import 'package:flutter/material.dart';
import 'package:nathan_card_app/nav_bar_page.dart';
import 'package:nathan_card_app/providers/card_detials_controller.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/card_details_page_view.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/components/card_scanner.dart';
import 'package:nathan_card_app/screens/cardsPage/cards_page_view.dart';
import 'package:nathan_card_app/screens/splashPage/splash_page_view.dart';
import 'package:nathan_card_app/theme/theme_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeMode _themeMode = ThemeController.themeMode;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
          value: CardDetailsController(),
        ),
      ],
      child: MaterialApp(

        title: 'Card Guardian',
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Color(0xFF2F3743)),
        themeMode: _themeMode,
        // home: NavBarPage(),
        home: SplashPageView(),
        // home: MainScreen(),
        // home: MainScreen(),
      ),
    );
  }
}
