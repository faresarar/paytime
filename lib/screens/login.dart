import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';
import 'email_verification.dart';
import 'forgot_password.dart';
import 'registration.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool passwordVisible = false;
  final formKey = GlobalKey<FormState>();
  final bool _isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.teal),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 75),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PayTime', style: AppTextStyles.title),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Welcome Back',
                          style: AppTextStyles.body,
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          icon: Icons.lock,
                          labelText: 'Password',
                          controller: passwordController,
                          obscureText: passwordVisible,
                          onChanged: (val) {
                            setState(() {});
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButtonPage(
                          text: 'Login',
                          onPressed: () {
                            newScreenReplaceMent(
                                context, const EmailVerifyLink());
                          },
                        ),
                        const SizedBox(height: 20),
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: AppTextStyles.body,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Create one here',
                                style: AppTextStyles.page,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    newScreenReplaceMent(
                                        context, const RegisterPage());
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            newScreenReplaceMent(
                                context, const ForgetPassword());
                          },
                          child: Text('Forgot password?',
                              style: AppTextStyles.page),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
