import 'package:flutter/material.dart';
import 'package:nathan_card_app/providers/card_detials_controller.dart';
import 'package:nathan_card_app/theme/theme_controller.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:provider/provider.dart';

class ScannerBtn extends StatelessWidget {
  const ScannerBtn({Key? key}) : super(key: key);

  Future<void> scanCard(context) async {
    final cController = Provider.of<CardDetailsController>(context,listen: false);

    // final CardDetails? cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    // if ( !mounted || cardDetails == null ) return;
    var cardDetails = await CardScanner.scanCard();
    // setState(() {
    //   _cardDetails = cardDetails;
    // });
    String? cardNum = cardDetails?.cardNumber!;
    String? exDate = cardDetails?.expiryDate!;
    String? cardName = cardDetails?.cardHolderName!;
    String? cardType = cardDetails?.cardIssuer!;

    cController.setCardNumber(cardNum!);
    cController.setExpiryDate(exDate!);
    cController.setCardHolderName(cardName!);
    cController.setCardType(cardType!);
    cController.inferCardType(context);

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        scanCard(context);
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            border: Border.all(
              color:ThemeController.of(context).primaryColor!,    // Border color
              width: 1.0,           // Border width
            ),
            borderRadius:
            BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              "Scan Card",
              style: ThemeController.of(context)
                  .bodyText1
                  .override(
                fontFamily: 'Poppins',
                color:
                ThemeController.of(context)
                    .primaryText,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
