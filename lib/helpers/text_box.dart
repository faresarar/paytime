import 'package:flutter/material.dart';
import 'package:paytime/helpers/form_field.dart';

class TextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const TextBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.only(left: 15, bottom: 5),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sectionName, style: AppTextStyles.stream),
                IconButton(onPressed: onPressed, icon: const Icon(Icons.edit))
              ],
            ),
            Text(text, style: AppTextStyles.stream)
          ],
        ),
      ),
    );
  }
}
