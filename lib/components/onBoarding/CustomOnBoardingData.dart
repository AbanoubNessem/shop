import 'package:flutter/material.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/services/cache_helper.dart';

class CustomOnBoardingData {
  bool isLast = false;
  var boardingController = PageController();

  void nextPage(context) {
    if (isLast == false) {
      boardingController.nextPage(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn);
    } else {
      CacheHelper.saveData(key: "onBoarding", value: true).then((value){
        if(value){
          Navigator.pushReplacementNamed(context, ScreensNames.login);
        }
      });

    }
  }
}
