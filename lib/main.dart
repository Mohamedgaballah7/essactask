
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task2/ui/authentication/login/login_screen.dart';
import 'package:task2/ui/settings/setting_screen.dart';
import 'package:task2/utils/app_routes.dart';
import 'package:task2/utils/app_theme.dart';
import 'firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseFirestore.instance.disableNetwork();
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginRouteName,
          routes: {
            AppRoutes.loginRouteName: (context) => LoginScreen(),
            AppRoutes.settingRouteName: (context) => SettingScreen(),

          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}