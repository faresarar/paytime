import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';
import 'login.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool isEmailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              newScreenReplaceMent(context, const LoginPage());
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: AppColors.tealColor,
        title: Text('Forgot Password', style: AppTextStyles.subtitle),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Enter the email associated with your account and will we send you a link.',
                    style: GoogleFonts.montaga(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                        letterSpacing: 0.7),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomFormField(
                    icon: Icons.email,
                    labelText: 'Email',
                    controller: emailController,
                    onChanged: (val) {
                      setState(() {});
                    },
                    validator: (val) {
                      return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButtonPage(
                  text: 'Send Reset Link',
                  onPressed: () {},
                ),
                if (isEmailSent)
                  Text(
                    'passsword reset link sent to ${emailController.text}',
                    style: GoogleFonts.montaga(
                        color: const Color.fromARGB(255, 7, 125, 11),
                        fontSize: 20),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
