// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';

class ChangePin extends StatefulWidget {
  const ChangePin({super.key});

  @override
  State<ChangePin> createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  final oldPinController = TextEditingController();
  final newPinController = TextEditingController();

  bool pinVisible = false;

  @override
  void initState() {
    pinVisible = true;
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
        title: Text('Change Pin', style: AppTextStyles.subtitle),
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
                  labelText: 'Old Pin',
                  controller: oldPinController,
                  obscureText: pinVisible,
                  keyBoard: TextInputType.number,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  icon: Icons.lock,
                  labelText: 'New Pin',
                  controller: newPinController,
                  obscureText: pinVisible,
                  keyBoard: TextInputType.number,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButtonPage(
                  onPressed: () {},
                  text: 'Change Pin',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
