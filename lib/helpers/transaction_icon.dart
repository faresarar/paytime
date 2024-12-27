import 'package:flutter/material.dart';
import 'package:paytime/helpers/form_field.dart';

class TransactionIcons extends StatelessWidget {
  final String imageData;
  final String text1;
  final String text2;

  const TransactionIcons({
    super.key,
    required this.imageData,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 20,
                              spreadRadius: -3)
                        ]),
                    height: 60,
                    child: Image(
                      image: AssetImage(imageData),
                      color: AppColors.tealColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text1,
                          style: AppTextStyles.body,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          text2,
                          style: AppTextStyles.page,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}
