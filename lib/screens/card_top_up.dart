import 'package:flutter/material.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';

class CardTopUp extends StatefulWidget {
  const CardTopUp({super.key});

  @override
  State<CardTopUp> createState() => _CardTopUpState();
}

class _CardTopUpState extends State<CardTopUp> {
  TextEditingController amountController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: AppColors.tealColor,
          centerTitle: true,
          title: Text(
            'Card Top Up',
            style: AppTextStyles.appBarStyle,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomFormField(
                  keyBoard: TextInputType.number,
                  icon: Icons.money,
                  labelText: 'Amount in Usd',
                  controller: amountController),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButtonPage(
                text: 'Add Money',
                onPressed: () {
                  _showCardInputDialog(context);
                })
          ],
        ),
      ),
    );
  }

  void _showCardInputDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Card Details',
                  style: AppTextStyles.stream,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  labelText: 'Card Number',
                  controller: cardNumberController,
                  keyBoard: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomFormField(
                        labelText: 'Expiry Date',
                        controller: expiryDateController,
                        keyBoard: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: CustomFormField(
                        labelText: 'CVV',
                        controller: cvvController,
                        keyBoard: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Add logic to process card details and make payment
                  },
                  child: Text(
                    'Pay Now',
                    style: AppTextStyles.body,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.cancel,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
