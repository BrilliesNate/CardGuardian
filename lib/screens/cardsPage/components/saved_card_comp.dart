import 'package:flutter/material.dart';

import '../../../theme/theme_controller.dart';

class SavedCard extends StatelessWidget {
  String? cardName;
  String? cardNumber;
  String? expiryDate;
  String? cvvCode;
  String? cardType;
   SavedCard({Key? key, required this.cardName, required this.cardNumber, required this.expiryDate, required this.cvvCode, required this.cardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.13,

        decoration: BoxDecoration(
          border: Border.all(
            color:ThemeController.of(context).primaryColor!,    // Border color
            width: 1.0,           // Border width
          ),
          borderRadius:
          BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsetsDirectional.fromSTEB(8, 20, 8, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(

                    Icons.credit_card,
                    color: ThemeController.of(context)
                        .primaryText,
                    size: 10,
                  ),
                  Text(
                   cardType!,
                    style: ThemeController.of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color:
                      ThemeController.of(context)
                          .primaryText,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsetsDirectional.fromSTEB(8,8, 8, 0),
              child: Row(
                children: [
                  Text(
                    cardNumber!,
                    style: ThemeController.of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color:
                      ThemeController.of(context)
                          .secondaryText,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cardName!,
                    style: ThemeController.of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color:
                      ThemeController.of(context)
                          .primaryText,
                      fontSize: 10,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "valid thru",
                        style: ThemeController.of(context)
                            .bodyText1
                            .override(
                          fontFamily: 'Poppins',
                          color:
                          ThemeController.of(context)
                              .secondaryText,
                          fontSize: 6,
                        ),
                      ),
                      Text(
                        expiryDate!,
                        style: ThemeController.of(context)
                            .bodyText1
                            .override(
                          fontFamily: 'Poppins',
                          color:
                          ThemeController.of(context)
                              .secondaryText,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
