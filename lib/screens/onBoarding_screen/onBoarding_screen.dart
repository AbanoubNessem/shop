import 'package:flutter/material.dart';
import 'package:shop/components/onBoarding/on_boarding.dart';

import 'package:shop/screens/onBoarding_screen/components/onBoarding_screen_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingData onBoardingData = OnBoardingData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: OnBoarding(listOnBoardingModel: onBoardingData.boardingData)),
    );
  }
}
