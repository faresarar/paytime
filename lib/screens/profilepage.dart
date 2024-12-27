import 'package:flutter/material.dart';
import '../helpers/text_box.dart';

import '../helpers/form_field.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: AppTextStyles.appBarStyle,
        ),
        backgroundColor: AppColors.tealColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 5),
          const Center(
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(
                'https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle image selection
                },
                child: Text(
                  'Select Image',
                  style: AppTextStyles.page,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text('example@example.com', // Replace with actual email
              textAlign: TextAlign.center,
              style: AppTextStyles.body),
          TextBox(
            text: 'John Doe', // Replace with actual name
            sectionName: 'Name',
            onPressed: () {
              // Handle name edit
            },
          ),
          TextBox(
            text: '01/01/2000', // Replace with actual DOB
            sectionName: 'DOB',
            onPressed: () {
              // Handle DOB edit
            },
          ),
          TextBox(
            text: 'Male', // Replace with actual gender
            sectionName: 'Gender',
            onPressed: () {
              // Handle gender edit
            },
          ),
          TextBox(
            text: 'Country', // Replace with actual country
            sectionName: 'Country',
            onPressed: () {
              // Handle country edit
            },
          ),
          TextBox(
            text: 'State', // Replace with actual state
            sectionName: 'State',
            onPressed: () {
              // Handle state edit
            },
          ),
          TextBox(
            text: 'Address', // Replace with actual address
            sectionName: 'Address',
            onPressed: () {
              // Handle address edit
            },
          ),
          TextBox(
            text: '123-456-7890', // Replace with actual phone number
            sectionName: 'Phone Number',
            onPressed: () {
              // Handle phone number edit
            },
          ),
        ],
      ),
    );
  }
}
