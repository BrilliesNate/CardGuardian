import 'package:flutter/material.dart';
import 'package:nathan_card_app/screens/cardsPage/components/saved_card_comp.dart';

import '../../providers/card_detials_controller.dart';
import '../../theme/theme_controller.dart';
import '../cardDetailsPage/card_details_page_view.dart';
import 'package:provider/provider.dart';

class CardsPageView extends StatefulWidget {
  const CardsPageView({Key? key}) : super(key: key);

  @override
  State<CardsPageView> createState() => _CardsPageViewState();
}

class _CardsPageViewState extends State<CardsPageView> {
  bool init = false;
  List<Widget> savedCards = [];

  initCards() async {
    if (!init) {
      init = true;
      // Credit card provider
      final cController =
      Provider.of<CardDetailsController>(context);
     await cController.loadCreditCards();

      for (var i = 0; i < cController.creditCardList.length; i++) {
        savedCards.add(SavedCard(
            cardName: cController.creditCardList[i].cardHolderName,
            cardNumber: cController.creditCardList[i].cardNumber,
            expiryDate: cController.creditCardList[i].expiryDate,
            cvvCode: cController.creditCardList[i].cvvCode,
            cardType: cController.creditCardList[i].cardType));
      }
      setState(() {

      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final cController = Provider.of<CardDetailsController>(context, listen:false);
    initCards();
    return Scaffold(
      backgroundColor: ThemeController
          .of(context)
          .primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: savedCards,
            ),
            InkWell(
              onTap: () {
                cController.setTabIndex(2);
                cController.navToNewPage();
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: ThemeController
                        .of(context)
                        .primaryText,
                    size: 20,
                  ),
                  Text(
                    "Add Card",
                    style: ThemeController
                        .of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color: ThemeController
                          .of(context)
                          .primaryText,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
