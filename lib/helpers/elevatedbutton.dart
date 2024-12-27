import 'package:flutter/material.dart';
import 'package:paytime/helpers/form_field.dart';

class ElevatedButtonPage extends StatefulWidget {
  final String text;
  final Function() onPressed;

  const ElevatedButtonPage(
      {super.key, required this.text, required this.onPressed});

  @override
  State<ElevatedButtonPage> createState() => _ElevatedButtonPageState();
}

class _ElevatedButtonPageState extends State<ElevatedButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: widget.onPressed,
          child: Text(widget.text, style: AppTextStyles.subtitle),
        ),
      ),
    );
  }
}

class ButtonPage extends StatefulWidget {
  final String text;
  final Function() onPressed;

  const ButtonPage({super.key, required this.text, required this.onPressed});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: widget.onPressed,
          child: Text(widget.text, style: AppTextStyles.textButtonSelec),
        ),
      ),
    );
  }
}
