import 'package:flutter/material.dart';

import '../../theme/theme_controller.dart';
import 'components/banned_btn_comp.dart';
import 'components/banned_country_input_comp.dart';

class BannedCountriesPageView extends StatefulWidget {
  const BannedCountriesPageView({Key? key}) : super(key: key);

  @override
  State<BannedCountriesPageView> createState() => _BannedCountriesPageViewState();
}

class _BannedCountriesPageViewState extends State<BannedCountriesPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeController.of(context).primaryBackground,
        body: SafeArea(child:SingleChildScrollView(
          child: Column(
            children:  const [
              BannedCountryInputComp(),
              BannedBtn(),

              // CountryPicker(),
            ],
          ),
        ))
    );
  }
}
