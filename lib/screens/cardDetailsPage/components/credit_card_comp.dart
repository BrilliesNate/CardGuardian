import 'package:flutter/material.dart';
import 'package:nathan_card_app/providers/card_detials_controller.dart';

import '../../../theme/theme_controller.dart';

import 'package:provider/provider.dart';


class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {

  final cController = Provider.of<CardDetailsController>(context);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.23,

        decoration: BoxDecoration(
          border: Border.all(
            color:ThemeController.of(context).secondaryBackground!,    // Border color
            width: 1.0,           // Border width
          ),
          borderRadius:
          BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding:EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(

                         Icons.credit_card,
                    color: ThemeController.of(context)
                        .primaryText,
                    size: 20,
                  ),
                  Text(
                   cController.cardType!,
                    style: ThemeController.of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color:
                      ThemeController.of(context)
                          .primaryText,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsetsDirectional.fromSTEB(20,20, 20, 0),
              child: Row(
                children: [
                  Text(
                    cController.cardNumber!,
                    style: ThemeController.of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color:
                      ThemeController.of(context)
                          .secondaryText,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cController.cardHolderName!,
                    style: ThemeController.of(context)
                        .bodyText1
                        .override(
                      fontFamily: 'Poppins',
                      color:
                      ThemeController.of(context)
                          .primaryText,
                      fontSize: 17,
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
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        cController.expiryDate!,
                        style: ThemeController.of(context)
                            .bodyText1
                            .override(
                          fontFamily: 'Poppins',
                          color:
                          ThemeController.of(context)
                              .secondaryText,
                          fontSize: 16,
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
