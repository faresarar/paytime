import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>>? cardNumberKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>>? cvvCodeKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>>? expiryDateKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>>? cardHolderKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tealColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text('Add Card', style: AppTextStyles.appBarStyle),
      ),
      body: SafeArea(
          child: Column(
        children: [
          CreditCardWidget(
            cardBgColor: AppColors.tealColor,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            obscureCardCvv: true,
            obscureCardNumber: true,
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: CardType.visa,
                cardImage: Image.asset(
                  'assets/images/visa.png',
                  height: 48,
                  width: 48,
                ),
              ),
              CustomCardTypeIcon(
                cardType: CardType.mastercard,
                cardImage: Image.asset(
                  'assets/images/mastercard.png.png',
                  height: 48,
                  width: 48,
                ),
              ),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                CreditCardForm(
                  formKey: formKey, // Required
                  cardNumber: cardNumber, // Required
                  expiryDate: expiryDate, // Required
                  cardHolderName: cardHolderName, // Required
                  cvvCode: cvvCode, // Required
                  cardNumberKey: cardNumberKey,
                  cvvCodeKey: cvvCodeKey,
                  expiryDateKey: expiryDateKey,
                  cardHolderKey: cardHolderKey,
                  onCreditCardModelChange:
                      (CreditCardModel data) {}, // Required
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  enableCvv: true,
                  cvvValidationMessage: 'Please input a valid CVV',
                  dateValidationMessage: 'Please input a valid date',
                  numberValidationMessage: 'Please input a valid number',
                  cardNumberValidator: (String? cardNumber) {
                    return null;
                  },
                  expiryDateValidator: (String? expiryDate) {
                    return null;
                  },
                  cvvValidator: (String? cvv) {
                    return null;
                  },
                  cardHolderValidator: (String? cardHolderName) {
                    return null;
                  },
                  onFormComplete: () {
                    // callback to execute at the end of filling card data
                  },
                  autovalidateMode: AutovalidateMode.always,
                  disableCardNumberAutoFillHints: false,
                  inputConfiguration: InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Number',
                      labelStyle: AppTextStyles.page,
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Expired Date',
                      labelStyle: AppTextStyles.page,
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'CVV',
                      labelStyle: AppTextStyles.page,
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Card Holder',
                        labelStyle: AppTextStyles.page),
                    cardNumberTextStyle: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    cardHolderTextStyle: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    expiryDateTextStyle: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    cvvCodeTextStyle: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButtonPage(
                  text: 'Validate',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    } else {}
                  },
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }

  showValidDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Valid",
          ),
          content: const Text("Your card successfully valid !!!"),
          actions: [
            TextButton(
                child: const Text(
                  "Ok",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
