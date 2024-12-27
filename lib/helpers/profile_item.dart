import 'package:flutter/material.dart';
import 'package:paytime/helpers/form_field.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.grey[100]),
        child: Icon(
          icon,
          color: AppColors.tealColor,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.body,
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[100]),
              child: const Icon(
                Icons.arrow_right,
                size: 20,
                color: AppColors.tealColor,
              ),
            )
          : null,
    );
  }
}
