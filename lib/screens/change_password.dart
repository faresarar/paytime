// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  bool passwordVisible = false;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: AppColors.tealColor,
        title: Text('Change Password', style: AppTextStyles.subtitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomFormField(
                  icon: Icons.lock,
                  labelText: 'Old Password',
                  controller: oldPasswordController,
                  obscureText: passwordVisible,
                  onChanged: (val) {
                    setState(() {});
                  },
                  validator: (val) {
                    if (!RegExp(
                            r'(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,})$')
                        .hasMatch(val!)) {
                      return 'Password must contain at least 1 capital letter, 1 small \nletter, 1 number, and be at least 8 characters long';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  icon: Icons.lock,
                  labelText: 'New Password',
                  controller: newPasswordController,
                  obscureText: passwordVisible,
                  onChanged: (val) {
                    setState(() {});
                  },
                  validator: (val) {
                    if (!RegExp(
                            r'(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,})$')
                        .hasMatch(val!)) {
                      return 'Password must contain at least 1 capital letter, 1 small \nletter, 1 number, and be at least 8 characters long';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButtonPage(
                  onPressed: () async {},
                  text: 'Change Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
