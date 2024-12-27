import 'package:flutter/material.dart';

import '../helpers/form_field.dart';
import '../helpers/profile_item.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Settings',
          style: AppTextStyles.appBarStyle,
        ),
        backgroundColor: AppColors.tealColor,
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ProfileItem(
                  title: 'Increase Limit',
                  icon: Icons.format_list_numbered,
                  onPress: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                ProfileItem(
                  title: 'Terms/Services',
                  icon: Icons.password,
                  onPress: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                ProfileItem(
                  title: 'Report Fraud',
                  icon: Icons.person,
                  onPress: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                ProfileItem(
                  title: 'Request Deletaion Of Account',
                  icon: Icons.settings,
                  onPress: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
