import 'package:flutter/material.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';
import 'add_card.dart';


class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.tealColor,
        title: Text(
          'My Cards',
          style: AppTextStyles.appBarStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 400,
              height: 240,
              margin: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 9, 56, 111),
                  Color.fromARGB(255, 10, 75, 141),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Stack(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image(
                              image: AssetImage('assets/images/visa.png')),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: Text('CARD HOLDER NAME', style: AppTextStyles.card),
                  ),
                  Positioned(
                    top: 45.0,
                    left: 16.0,
                    child: Text(' John Doe ', style: AppTextStyles.card),
                  ),
                  Positioned(
                    top: 125.0,
                    left: 16.0,
                    child: Text('CARD NUMBER', style: AppTextStyles.card),
                  ),
                  Positioned(
                    top: 145.0,
                    left: 16.0,
                    child:
                        Text('**** **** **** 1234', style: AppTextStyles.card),
                  ),
                  Positioned(
                    top: 190.0,
                    left: 16.0,
                    child: Text('EXPIRY DATE', style: AppTextStyles.card),
                  ),
                  Positioned(
                    top: 210.0,
                    left: 16.0,
                    child: Text('08/25', style: AppTextStyles.card),
                  ),
                  Positioned(
                    top: 190.0,
                    right: 16.0,
                    child: Text('CVV', style: AppTextStyles.card),
                  ),
                  Positioned(
                    top: 210.0,
                    right: 16.0,
                    child: Text('123', style: AppTextStyles.card),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButtonPage(
                text: 'Add Card',
                onPressed: () {
                  newScreenReplaceMent(context, const AddCardPage());
                })
          ],
        ),
      ),
    );
  }
}
