import 'package:flutter/material.dart';
import 'package:paytime/helpers/form_field.dart';

class Buttons extends StatelessWidget {
  final String iconImage;
  final String iconText;
  final String iconText2;

  const Buttons(
      {super.key,
      required this.iconImage,
      required this.iconText,
      required this.iconText2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 20,
                    spreadRadius: -3),
              ],
            ),
            child: Image(
              image: AssetImage(iconImage),
              color: AppColors.tealColor,
            ),
          ),
        ),
        Text(iconText, style: AppTextStyles.page),
        Text(iconText2, style: AppTextStyles.page),
      ],
    );
  }
}
