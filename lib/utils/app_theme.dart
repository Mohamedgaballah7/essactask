import 'package:flutter/material.dart';
import 'package:task2/utils/app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(35),
            side: BorderSide(
              color: AppColors.whiteColor,
              width: 2,
            ))
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: AppColors.whiteColor,
      showSelectedLabels: true,
      selectedItemColor: AppColors.whiteColor,
    ),
    primaryColor: AppColors.primaryLight,
    focusColor: AppColors.whiteColor,
    primaryColorDark: AppColors.blackColor,
    primaryColorLight: AppColors.greyColor,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.bold16Primary,
      headlineSmall: AppStyles.bold16White,
      labelSmall: AppStyles.bold14Black,
      labelMedium: AppStyles.medium14grey,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.whiteBgColor,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color:AppColors.blackColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(35),
            side: BorderSide(
              color: AppColors.whiteColor,
              width: 2,
            )
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparentColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.whiteColor,
      showSelectedLabels: true,
    ),
    primaryColor: AppColors.primaryDark,
    focusColor: AppColors.primaryLight,
    primaryColorDark: AppColors.primaryLight,
    primaryColorLight: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.primaryDark,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20White,
        headlineMedium: AppStyles.bold16White,
      headlineSmall: AppStyles.bold16White,
      labelSmall: AppStyles.bold14White,
      labelMedium: AppStyles.medium14White,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.primaryDark,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color:AppColors.whiteColor,
      ),
    ),
  );

}