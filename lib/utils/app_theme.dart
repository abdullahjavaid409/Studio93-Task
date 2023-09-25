import 'package:task/all_utils.dart';

class AppTheme {
  static ThemeData buildTheme() {
    final baseData = ThemeData.light();
    final textTheme = baseData.textTheme;
    final newTextTheme = textTheme
        .copyWith(
            headlineLarge: TextStyle(
              fontSize: 32.sp,
              color: AppColor.lightBlackColor,
              fontWeight: FontWeight.w700,
            ),
            titleMedium: TextStyle(
              fontSize: 14.sp,
              color: AppColor.lightBlackColor,
              fontWeight: FontWeight.w500,
            ),
            headlineMedium: TextStyle(
              fontSize: 20.sp,
              letterSpacing: 0.1,
              color: AppColor.lightBlackColor,
              fontWeight: FontWeight.w400,
            ),
            headlineSmall: TextStyle(
              fontSize: 14.sp,
              color: AppColor.lightBlackColor,
              fontWeight: FontWeight.w300,
            ))
        .apply(fontFamily: 'Kamerik105');

    return baseData.copyWith(
      scaffoldBackgroundColor: AppColor.backGroundColor,
      textTheme: newTextTheme,
    );
  }

// All Styles
}
