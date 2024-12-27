import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helpers/buttons.dart';
import '../helpers/form_field.dart';
import '../helpers/transaction_icon.dart';
import 'card_top_up.dart';
import 'exchange_money.dart';
import 'transfer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imagePaths = [
    'assets/images/onlinepayments.jpeg',
    'assets/images/sendfunds.jpeg',
    'assets/images/moneychange.jpeg',
    'assets/images/cardpay.jpeg'
  ];

  PageController controller = PageController(initialPage: 0);

  List<String> accountBalanceTexts = ['\$10 USD', '£19 GBP', '€28 EUR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              AssetImage('assets/images/minions.jpeg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text('Hi', style: AppTextStyles.userName),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ClipRect(
                          child: Text(
                            'John Doe',
                            style: AppTextStyles.userName,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to notifications page
                        },
                        child: const Icon(
                          Icons.notifications,
                          color: AppColors.tealColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 80,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.tealColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: accountBalanceTexts[0],
                          items: accountBalanceTexts
                              .map((String text) => DropdownMenuItem<String>(
                                    value: text,
                                    child: Text(text),
                                  ))
                              .toList(),
                          onChanged: (String? newValue) {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                height: 220,
                child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Background(imageData: imagePaths[index]);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                controller: controller,
                count: imagePaths.length,
                effect: const ScrollingDotsEffect(
                  activeDotScale: 1.4,
                  activeDotColor: AppColors.tealColor,
                  dotColor: Colors.blueGrey,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    newScreenReplaceMent(context, const CardTopUp());
                  },
                  child: const Buttons(
                    iconImage: 'assets/images/add money.png',
                    iconText: 'Add',
                    iconText2: 'Money',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    newScreenReplaceMent(context, const TransferMoneyPage());
                  },
                  child: const Buttons(
                    iconImage: 'assets/images/send payment.png',
                    iconText: 'Transfer',
                    iconText2: 'Money',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    newScreenReplaceMent(context, const ExchangeMoneyPage());
                  },
                  child: const Buttons(
                    iconImage: 'assets/images/exchange.png',
                    iconText: 'Exchange',
                    iconText2: 'Money',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Navigate to Transaction Summary page
              },
              child: const TransactionIcons(
                imageData: 'assets/images/statistics.png',
                text1: 'Account Summary',
                text2: 'Breakdown Of All Transactions',
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to Transaction History page
              },
              child: const TransactionIcons(
                imageData: 'assets/images/transactions.png',
                text1: 'Transactions',
                text2: 'History',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final String imageData;

  const Background({required this.imageData, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageData),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
