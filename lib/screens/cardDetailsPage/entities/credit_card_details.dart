class CreditCardDetails {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  String cardType;
  String country;

  CreditCardDetails({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.cardType,
    required this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cardHolderName': cardHolderName,
      'cvvCode': cvvCode,
      'cardType': cardType,
      'country': country,
    };
  }

  factory CreditCardDetails.fromJson(Map<String, dynamic> json) {
    return CreditCardDetails(
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      cardHolderName: json['cardHolderName'],
      cvvCode: json['cvvCode'],
      cardType: json['cardType'],
      country: json['country']
    );
  }
}