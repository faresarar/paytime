import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/elevatedbutton.dart';
import '../helpers/form_field.dart';
import '../helpers/profile_item.dart';
import 'change_password.dart';
import 'change_pin.dart';
import 'login.dart';
import 'profilepage.dart';
import 'settings.dart';


class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Account Management',
          style: AppTextStyles.appBarStyle,
        ),
        backgroundColor: AppColors.tealColor,
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ProfileItem(
                  title: 'Change Transfer Pin',
                  icon: Icons.format_list_numbered,
                  onPress: () {
                    newScreenReplaceMent(context, const ChangePin());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileItem(
                  title: 'Change Password',
                  icon: Icons.password,
                  onPress: () {
                    newScreenReplaceMent(context, const ChangePassword());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileItem(
                  title: 'User Profile',
                  icon: Icons.person,
                  onPress: () {
                    newScreenReplaceMent(context, const Profiles());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileItem(
                  title: 'Settings',
                  icon: Icons.settings,
                  onPress: () {
                    newScreenReplaceMent(context, const Settings());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButtonPage(
                    text: 'Log Out',
                    onPressed: () {
                      newScreenReplaceMent(context, const LoginPage());
                    }),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Customer Support',
                    style: AppTextStyles.stream,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'support@example.com', // Placeholder email
                        style: AppTextStyles.stream,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '+1234567890', // Placeholder phone number
                        style: AppTextStyles.stream,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    text: "Chat a customer service personnel",
                    style: GoogleFonts.montaga(
                        color: AppColors.tealColor,
                        fontSize: 21,
                        fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // you can use twark.io for live chat or any other live chat services
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
