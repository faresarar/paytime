import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';
import 'email_verification.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordMatch() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    return password == confirmPassword;
  }

  bool isLoading = false;
  bool passwordVisible = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.teal),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('PayTime', style: AppTextStyles.title),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Your best way to pay',
                              style: AppTextStyles.body),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormField(
                            icon: Icons.email,
                            labelText: 'Email',
                            controller: emailController,
                            keyBoard: TextInputType.emailAddress,
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
                          const SizedBox(height: 20),
                          CustomFormField(
                            icon: Icons.person,
                            labelText: 'Name',
                            controller: nameController,
                            onChanged: (val) {
                              setState(() {});
                            },
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                return null;
                              } else {
                                return 'Full name cannot be empty';
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomFormField(
                            icon: Icons.lock,
                            labelText: 'Password',
                            controller: passwordController,
                            obscureText: passwordVisible,
                            onChanged: (val) {
                              setState(() {});
                            },
                            validator: (val) {
                              if (!RegExp(
                                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()-_+=])[A-Za-z\d!@#$%^&*()-_+=]{8,}$')
                                  .hasMatch(val ?? '')) {
                                return 'Password must contain at least 1 capital letter, 1 small letter, 1 number, and 1 special character, and be at least 8 characters long';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomFormField(
                            icon: Icons.lock,
                            labelText: 'Confirm Password',
                            controller: confirmPasswordController,
                            obscureText: passwordVisible,
                            onChanged: (val) {
                              setState(() {});
                            },
                            validator: (val) {
                              if (isPasswordMatch()) {
                                return null;
                              } else {
                                return 'Password mismatch';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButtonPage(
                              text: 'Register',
                              onPressed: () {
                                newScreenReplaceMent(
                                    context, const EmailVerifyLink());
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          Text.rich(
                            TextSpan(
                                text: "Alredy have an account? ",
                                style: AppTextStyles.body,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Login here",
                                      style: AppTextStyles.page,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          newScreenReplaceMent(
                                              context, const LoginPage());
                                        }),
                                ]),
                          ),
                        ]),
                  ),
                ),
              ),
      ),
    );
  }
}
