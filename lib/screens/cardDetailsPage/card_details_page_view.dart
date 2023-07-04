import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/components/button_comp.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/components/card_input_comp.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/components/credit_card_comp.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/components/scanner_btn_comp.dart';
import 'package:nathan_card_app/theme/theme_controller.dart';

import 'components/card_scanner.dart';
import 'components/country_picker.dart';


class CardDetailsPageView extends StatefulWidget {
  const CardDetailsPageView({Key? key}) : super(key: key);

  @override
  State<CardDetailsPageView> createState() => _CardDetailsPageViewState();
}

class _CardDetailsPageViewState extends State<CardDetailsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeController.of(context).primaryBackground,
      body: SafeArea(child:SingleChildScrollView(
        child: Column(
          children:  const [
            CreditCard(),
            CardDetailsInput(),
            ScannerBtn(),
            ValidateBtn(),

            // CountryPicker(),
          ],
        ),
      ))
    );
  }
}
