import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/utility/app_colores.dart';

class AppThemes {
  final ThemeData appThemeLight = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 100,
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.secondaryColor,
      unselectedItemColor: AppColors.blackColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      unselectedLabelStyle: TextStyle(
        color: AppColors.blackColor,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.secondaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.primaryScaffoldBackgroundColor,
      surfaceTintColor: AppColors.primaryScaffoldBackgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    ),
    fontFamily: 'Jannah',
    scaffoldBackgroundColor: AppColors.primaryScaffoldBackgroundColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColors.secondaryColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryTextColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
      size: 20,
    ),
    canvasColor: AppColors.secondaryColor,
    cardColor: AppColors.primaryTextColor,
  );
  final ThemeData appThemeDark = ThemeData(

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 100,
      backgroundColor: AppColors.primaryDarkColor,
      selectedItemColor: AppColors.secondaryColor,
      unselectedItemColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      unselectedLabelStyle: TextStyle(
        color: AppColors.blackColor,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.secondaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.primaryDarkColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    fontFamily: 'Jannah',
    scaffoldBackgroundColor: AppColors.primaryDarkScaffoldBackgroundColor,
    textTheme: const TextTheme(

      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryDarkTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryDarkTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColors.secondaryColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryDarkTextColor2,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryDarkColor,
      size: 20,
    ),
    canvasColor: AppColors.secondaryColor,
    cardColor: AppColors.primaryDarkTextColor2,
  );
}
