import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/form_field.dart';

class LoansPage extends StatefulWidget {
  const LoansPage({super.key});

  @override
  State<LoansPage> createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Loan Page',
          style: AppTextStyles.appBarStyle,
        ),
        backgroundColor: AppColors.tealColor,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[300]),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 16,
                            child: Text('Outstanding',
                                style: AppTextStyles.textButtonUnselect),
                          ),
                          Positioned(
                            top: 50,
                            left: 16,
                            child: Text('Loan',
                                style: AppTextStyles.textButtonUnselect),
                          ),
                          Positioned(
                            top: 90,
                            left: 16,
                            child: Text(
                                NumberFormat.simpleCurrency(
                                        locale: 'en-us', decimalDigits: 2)
                                    .format(000),
                                style: AppTextStyles.textButtonUnselect),
                          ),
                          Positioned(
                            top: 130,
                            left: 16,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Text('Pay Now', style: AppTextStyles.body),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.teal[300]),
                      width: 150,
                      height: 200,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 22,
                            left: 16,
                            child: Text('Eligibility',
                                style: AppTextStyles.textButtonUnselect),
                          ),
                          Positioned(
                            top: 80,
                            left: 16,
                            child: Text(
                                NumberFormat.simpleCurrency(
                                        locale: 'en-us', decimalDigits: 0)
                                    .format(10000),
                                style: AppTextStyles.textButtonUnselect),
                          ),
                          Positioned(
                            top: 130,
                            left: 16,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child:
                                  Text('Borrow Now', style: AppTextStyles.body),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 15, 15),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade50),
                    child: IconButton(
                      color: AppColors.tealColor,
                      onPressed: () {},
                      icon: const Icon(Icons.upload),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Upgrade loan limit', style: AppTextStyles.body),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 15, 15),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade50),
                    child: IconButton(
                      color: AppColors.tealColor,
                      onPressed: () {},
                      icon: const Icon(Icons.help_rounded),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Help', style: AppTextStyles.body),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
