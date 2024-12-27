import 'package:flutter/material.dart';

import '../helpers/form_field.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              'Payment Successful',
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: 120,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tealColor),
                onPressed: () {
                  // Add logic for 'Done' button
                  Navigator.pop(
                      context); // You can navigate to a different screen if needed
                },
                child: Text(
                  'Done',
                  style: AppTextStyles.appBarStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
