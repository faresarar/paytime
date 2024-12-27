import 'package:flutter/material.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';
import 'home_page.dart';


class EmailVerifyLink extends StatefulWidget {
  const EmailVerifyLink({super.key});

  @override
  State<EmailVerifyLink> createState() => _EmailVerifyLinkState();
}

class _EmailVerifyLinkState extends State<EmailVerifyLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text('Welcome to PayTime', style: AppTextStyles.title),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/onlinebank.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    'An email has been sent to paytime@pay.com please verify your email to continue.',
                    style: AppTextStyles.page),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButtonPage(
                  onPressed: () {
                    newScreenReplaceMent(context, const HomePage());
                  },
                  text: 'Continue',
                ),
              ),
              const SizedBox(width: 15.0),
              TextButton(
                onPressed: () {},
                child: Text('Resend Verification Email',
                    style: AppTextStyles.body),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
