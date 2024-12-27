import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helpers/form_field.dart';
import 'registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BuildContext? pageContext;

  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              _buildFirstPage(),
              _buildLastPage(),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.tealColor,
                    dotHeight: 13,
                    dotWidth: 13,
                    expansionFactor: 2),
                onDotClicked: (index) {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPage() {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 1.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'PayTime',
                  style: GoogleFonts.akronim(
                      fontSize: 40,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[500]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Welcome To The World Of Smart Payments',
                  style: AppTextStyles.body),
              Expanded(
                child: Image.asset(
                  'assets/images/Mobile payments-rafiki.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLastPage() {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'PayTime',
                      style: GoogleFonts.akronim(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[500]),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Easy And Stress Free Payment Gateway.',
                    style: AppTextStyles.body,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/Payment Information-bro.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 16.0,
          child: SizedBox(
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[100]),
              onPressed: () {
                // Capture the context before entering the asynchronous block
                pageContext = Navigator.of(context).overlay!.context;

                // Navigate to the registration page using the captured context
                Navigator.pushReplacement(
                  pageContext!,
                  MaterialPageRoute(
                      builder: (pageContext) => const RegisterPage()),
                );
              },
              child: Text('Get Started', style: AppTextStyles.body),
            ),
          ),
        ),
      ],
    );
  }
}
