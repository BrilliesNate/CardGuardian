import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nathan_card_app/screens/cardDetailsPage/entities/credit_card_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/cardDetailsPage/components/alert_dialog_comp.dart';
import '../screens/cardDetailsPage/entities/banned_countires.dart';

class CardDetailsController extends ChangeNotifier {
  String? cardNumber = 'XXXX XXXX XXXX XXXX';
  String? expiryDate = 'XX/XX';
  String? cardHolderName = 'CARD NAME';
  String cvvCode = '***';
  String? cardType = "Card type";
  String country = "SA";
  Color cardNInputColor = Color(0xFF454E57);
  bool cardSaved = false;
  List<BannedCard> bannedCards = [
    BannedCard('4123123412341234', ['South Africa', 'Country B']),
  ];

  int tabIndex = 1;
  late PageController pageController;


  setTabIndex(int v) {
    tabIndex = v;
    notifyListeners();
  }

  List<CreditCardDetails> creditCardList = [];

  setCardNumber(String value) {
    cardNumber = value;
    notifyListeners();
  }

  setExpiryDate(String value) {
    expiryDate = value;
    notifyListeners();
  }

  setCardHolderName(String value) {
    cardHolderName = value;
    notifyListeners();
  }

  setCvvCode(String value) {
    cvvCode = value;
    notifyListeners();
  }

  setCardType(String value){
    cardType = value;
    notifyListeners();
  }

  // infer Card Type

  // Visa: starts with 4 and has a length of 16
  // Mastercard: starts with 51, 52, 53, 54, or 55 and has a length of 16
  // American Express: starts with 34 or 37 and has a length of 15
  // Discover: starts with 6011, 622126-622925, 644-649, or 65 and has a length of 16

  inferCardType(context) {
    String cleanedCardNumber = cardNumber!.replaceAll(RegExp(r'\D'), '');

    if (RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$').hasMatch(cleanedCardNumber)) {
      cardType = "Visa";
      saveCreditCardDetails(context);
    } else if (RegExp(r'^5[1-5][0-9]{14}$').hasMatch(cleanedCardNumber)) {
      cardType = "Mastercard";
      saveCreditCardDetails(context);
    } else if (RegExp(r'^3[47][0-9]{13}$').hasMatch(cleanedCardNumber)) {
      cardType = "American Express";
      saveCreditCardDetails(context);
    } else if (RegExp(r'^6(?:011|5[0-9]{2})[0-9]{12}$')
        .hasMatch(cleanedCardNumber)) {
      cardType = "Discover";
      saveCreditCardDetails(context);
    } else {
      // check if card number has enough characters to be a valid card number
      cardType = "";
    }

    notifyListeners();
  }


  // Saving Credit Card Details to local as CreditCardDetails Object.
  Future<void> saveCreditCardDetails(context) async {
    CreditCardDetails cdd = CreditCardDetails(
      cardNumber: cardNumber!,
      expiryDate: expiryDate!,
      cardHolderName: cardHolderName!,
      cvvCode: cvvCode,
      cardType: cardType!,
      country: country,
    );

    await loadCreditCards();

    // check if card is banned
    if (isCardBannedInCountry(cardNumber!, country)) {
      _showMyDialog(context, 101);
      print("Warning: This card ($cardNumber) is banned in $country");
    } else {
      print("Card ($cardNumber) is valid in $country");

      // check if the card was saved before
      cardUniqueCheck(cdd);

      if (cardSaved) {
        print("Card already saved");
         _showMyDialog(context, 100);

      } else {
        creditCardList.add(cdd);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> stringList =
        creditCardList.map((cdd) => jsonEncode(cdd.toJson())).toList();
        print(stringList[0]);
        await prefs.setStringList('creditCardList', stringList);
      }
    }
  }

  // To check if card is already saved using card number
  cardUniqueCheck(card) {
    for (var i = 0; i < creditCardList.length; i++) {
      if (creditCardList[i].cardNumber == card.cardNumber) {
        cardSaved = true;
      } else {
        cardSaved = false;
      }
    }
  }

  // loading saved credit card details if there was a card saved.
  Future loadCreditCards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cardList = prefs.getStringList('creditCardList');

    if (cardList != null) {
      var list = cardList.map((json) => cardFromJson(json)).toList();
      creditCardList = list;
    } else {
      print("Credit card list is empty");
      creditCardList = [];
    }
  }

  CreditCardDetails cardFromJson(String json) {
    return CreditCardDetails.fromJson(jsonDecode(json));
  }

  bool isCardBannedInCountry(String cardNumber, String country) {
    for (var bannedCard in bannedCards) {
      if (bannedCard.cardNumber == cardNumber &&
          bannedCard.bannedCountries.contains(country)) {
        return true;
      }
    }
    return false;
  }

  bool initPage = false;
  initPageController() {
    if (!initPage) {
      initPage = true;
      pageController = PageController(initialPage: tabIndex);
    }
  }

  navToNewPage(){
    pageController.animateToPage( tabIndex,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

   Future<void> _showMyDialog(context,errorCode) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  AlertDialogComp(errorCode: errorCode,);

      },
    );
  }

}
