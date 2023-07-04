import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:nathan_card_app/providers/card_detials_controller.dart';
import 'package:nathan_card_app/screens/bannedCountriesConfigPage/banned_countries_page_view.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/card_details_page_view.dart';
import 'package:nathan_card_app/screens/cardsPage/cards_page_view.dart';
import 'package:nathan_card_app/theme/theme_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage>  with SingleTickerProviderStateMixin {







  @override
  Widget build(BuildContext context) {
    final cController = Provider.of<CardDetailsController>(context);
   cController.initPageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeController.of(context).primaryColor,
        title: Text(
          "Card Guardian",
          style: ThemeController.of(context).bodyText1,
        ),

      ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Center(
            child: FaIcon(
              FontAwesomeIcons.globe,
              color: ThemeController.of(context).primaryColor,
              size: 20,
            ),
          ),
          Center(
            child: FaIcon(
              FontAwesomeIcons.solidCreditCard,
              color: ThemeController.of(context).primaryColor,
              size: 20,
            ),
          ),

          Center(
            child: FaIcon(
              FontAwesomeIcons.creditCard,
              color: ThemeController.of(context).primaryColor,
              size: 20,
            ),
          ),
        ],
          inactiveIcons: [
            Text(
              "Banned Countries",
              style: ThemeController.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: ThemeController.of(context).secondaryText,
                fontSize: 11,
              ),
            ),
            Text(
              "Saved Cards",
              style: ThemeController.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: ThemeController.of(context).secondaryText,
                fontSize: 11,
              ),
            ),
            Text(
              "New Card",
              style: ThemeController.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: ThemeController.of(context).secondaryText,
                fontSize: 11,
              ),
            ),
          ],
        color: ThemeController.of(context).primaryBackground!,

        height: 60,
        circleWidth: 55,
        // iconCurve:Curves.bounceOut,
        activeIndex: cController.tabIndex,
        onTap: (v) {
          cController.setTabIndex(v);
          cController.navToNewPage();

        },
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
        shadowColor: ThemeController.of(context).secondaryBackground!,
        // shadowColor:colorManager.batColor!,
        elevation: 10,
      ),
      body: PageView(
        controller: cController.pageController,
        onPageChanged: (v) {
          cController.setTabIndex(v);
        },
        children: const [
          BannedCountriesPageView(),
          CardsPageView(),
          CardDetailsPageView(),
        ],
      ),
    );
  }
}
