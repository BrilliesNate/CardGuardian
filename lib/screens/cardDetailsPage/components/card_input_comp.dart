import 'package:flutter/material.dart';
import 'package:nathan_card_app/providers/card_detials_controller.dart';
import 'package:nathan_card_app/theme/theme_controller.dart';
import 'package:provider/provider.dart';

class CardDetailsInput extends StatefulWidget {
  const CardDetailsInput({Key? key}) : super(key: key);

  @override
  State<CardDetailsInput> createState() => _CardDetailsInputState();
}

class _CardDetailsInputState extends State<CardDetailsInput> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController ccvNumController = TextEditingController();

  @override
  void initState() {
    cardNameController.addListener(() {
      setCardUI("", cardNameController.text, "", "");
      // setUserName(emailAddressController.text);
    });

    cardNumberController.addListener(() {
      setCardUI(cardNumberController.text, "", "", "");
    });

    expiryDateController.addListener(() {
      setCardUI("", "", expiryDateController.text, "");
    });
    ccvNumController.addListener(() {
      setCardUI("", "", "", ccvNumController.text);
    });
    super.initState();
  }

  void setCardUI(cardNumber, cardName, expiryDate, ccv) {
    final cController =
        Provider.of<CardDetailsController>(context, listen: false);

    if (cardNumber != "") {
      cController.setCardNumber(cardNumber);
      // cController.inferCardType(cardNumber);
    }
    if (cardName != "") {
      cController.setCardHolderName(cardName);
    }
    if (expiryDate != "") {
      cController.setExpiryDate(expiryDate);
    }
    if (ccv != "") {
      cController.setCvvCode(ccv);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Credit card provider
    final cController =
        Provider.of<CardDetailsController>(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
      child: Column(
        children: [
          // Name On card Input
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
                        "Name on card",
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
                  controller: cardNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: ThemeController.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: ThemeController.of(context).primaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: "Enter your Card Name",
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
          // Card Number Input
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
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: "Enter your Card Number",
                    hintStyle: ThemeController.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: ThemeController.of(context).primaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  cController.cardNInputColor,
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
          // Card Expiry date and Security code
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  3, 0, 0, 5),
                              child: Text(
                                "Expiry date",
                                style: ThemeController.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: ThemeController.of(context)
                                          .primaryText,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            TextFormField(
                              controller: expiryDateController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: ThemeController.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: ThemeController.of(context)
                                          .primaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: "XX/XX",
                                hintStyle: ThemeController.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: ThemeController.of(context)
                                          .primaryText,
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        ThemeController.of(context).alternate!,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(
                                        8.0), // Bottom right corner radius
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: ThemeController.of(context)
                                    .primaryBackground,
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        20, 4, 20, 24),
                              ),
                              style: ThemeController.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        ThemeController.of(context).primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  3, 0, 0, 5),
                              child: Text(
                                "Cvv Code",
                                style: ThemeController.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: ThemeController.of(context)
                                          .primaryText,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                            TextFormField(
                              controller: ccvNumController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: ThemeController.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: ThemeController.of(context)
                                          .primaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: "***",
                                hintStyle: ThemeController.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: ThemeController.of(context)
                                          .primaryText,
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        ThemeController.of(context).alternate!,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8.0),
                                    bottomRight: Radius.circular(
                                        8.0), // Bottom right corner radius
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: ThemeController.of(context)
                                    .primaryBackground,
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        20, 4, 20, 24),
                              ),
                              style: ThemeController.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        ThemeController.of(context).primaryText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
