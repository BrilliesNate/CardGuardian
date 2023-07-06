import 'package:flutter/material.dart';
import 'package:nathan_card_app/providers/card_detials_controller.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_controller.dart';

class BannedCountryInputComp extends StatefulWidget {
  const BannedCountryInputComp({Key? key}) : super(key: key);

  @override
  State<BannedCountryInputComp> createState() => _BannedCountryInputCompState();
}

class _BannedCountryInputCompState extends State<BannedCountryInputComp> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController bannedCountryController = TextEditingController();



  @override
  void initState() {
    cardNumberController.addListener(() {
      addBannedCountry(cardNumberController.text, "");
    });
    bannedCountryController.addListener(() {
      addBannedCountry("", bannedCountryController.text);
    });
    super.initState();
  }



  addBannedCountry(cardNumber, country) {
    final cController =
    Provider.of<CardDetailsController>(context, listen: false);

    if(cardNumber != ""){
      cController.setBannedCardNumber(cardNumber);
    }
    if(country != ""){
      cController.setBannedCountry(country);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
      child: Column(
        children: [
          // card number input to band
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(3, 0, 0, 5),
                      child: Text(
                        "Card Number",
                        style: ThemeController.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: ThemeController.of(context).primaryText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: cardNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: ThemeController.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: ThemeController.of(context).primaryText,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: "Enter card number to band",
                    hintStyle: ThemeController.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: ThemeController.of(context).primaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:ThemeController.of(context).alternate!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: ThemeController.of(context).primaryBackground,
                    contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 24),
                  ),
                  style: ThemeController.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: ThemeController.of(context).primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // banned country
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(3, 0, 0, 5),
                      child: Text(
                        "Country",
                        style: ThemeController.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: ThemeController.of(context).primaryText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: bannedCountryController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: ThemeController.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: ThemeController.of(context).primaryText,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: "Enter the country",
                    hintStyle: ThemeController.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: ThemeController.of(context).primaryText,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:ThemeController.of(context).alternate!,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: ThemeController.of(context).primaryBackground,
                    contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 24),
                  ),
                  style: ThemeController.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: ThemeController.of(context).primaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
