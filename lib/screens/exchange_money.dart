// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';

class ExchangeMoneyPage extends StatefulWidget {
  const ExchangeMoneyPage({super.key});

  @override
  State<ExchangeMoneyPage> createState() => _ExchangeMoneyPageState();
}

class _ExchangeMoneyPageState extends State<ExchangeMoneyPage> {
  String? _selectedFromCurrency;
  String? _selectedToCurrency;
  double? _exchangeRate;
  double? _amountToChange;

  late double usdBalance;
  late double eurBalance;
  late double gbpBalance;

  final List<String> _currencies = ['USD', 'EUR', 'GBP'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: AppColors.tealColor,
          title: Text(
            'Exchange Money',
            style: AppTextStyles.appBarStyle,
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (Theme.of(context).platform == TargetPlatform.android)
                      DropdownButton<String>(
                        value: _selectedFromCurrency,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedFromCurrency = newValue;
                          });
                        },
                        items: _currencies.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                      ),
                    if (Theme.of(context).platform == TargetPlatform.iOS)
                      CupertinoPicker(
                        itemExtent: 32.0,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            _selectedFromCurrency = _currencies[index];
                          });
                        },
                        children: _currencies.map((String currency) {
                          return Text(currency);
                        }).toList(),
                      ),
                    const SizedBox(height: 20),
                    if (Theme.of(context).platform == TargetPlatform.android)
                      DropdownButton<String>(
                        value: _selectedToCurrency,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedToCurrency = newValue;
                          });
                        },
                        items: _currencies.map((String currency) {
                          return DropdownMenuItem<String>(
                            value: currency,
                            child: Text(currency),
                          );
                        }).toList(),
                      ),
                    if (Theme.of(context).platform == TargetPlatform.iOS)
                      CupertinoPicker(
                        itemExtent: 32.0,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            _selectedToCurrency = _currencies[index];
                            // _updateExchangeRate(); // Removed function call
                          });
                        },
                        children: _currencies.map((String currency) {
                          return Text(currency);
                        }).toList(),
                      ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _amountToChange = double.tryParse(value);
                          // _updateChangedValue(); // Removed function call
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Amount To Change',
                        labelStyle: AppTextStyles.stream,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Changed Value',
                        labelStyle: AppTextStyles.stream,
                        suffixText: _exchangeRate != null
                            ? (_amountToChange != null
                                ? (_amountToChange! * _exchangeRate!)
                                    .toStringAsFixed(2)
                                : '')
                            : '',
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButtonPage(
                      text: 'Save Changed Value',
                      onPressed: () {}, // Removed function call
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
