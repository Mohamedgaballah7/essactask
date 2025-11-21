

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:task2/ui/widgets/custom_elavated_button.dart';
import 'package:task2/utils/app_assets.dart';
import 'package:task2/utils/app_colors.dart';
import 'package:task2/utils/app_routes.dart';
import 'package:task2/utils/app_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),


          // TODO: Add Facebook login logic
              CustomElavatedButton(
                onPressed: (){

                },
                textName: 'Login With Facebook',
                backgroundColor: AppColors.blueColor,
              ),


               SizedBox(height: 20.h),


          // TODO: Add Google login logic
              CustomElavatedButton(
                  onPressed: ()async{
                     await signInWithGoogle(context);
                    Navigator.pushReplacementNamed(context, AppRoutes.settingRouteName);
                  },
                isIcon: true,
                iconName:Image.asset(AppAssets.iconGoogle),
                textName: 'Login With Google',
                backgroundColor: AppColors.transparentColor,
                borderColor: AppColors.blackColor,
                textStyle: AppStyles.bold16Black,
              ),


               SizedBox(height: 30.h),


              TextButton(
                onPressed: () {
                 Navigator.pushReplacementNamed(context, AppRoutes.settingRouteName);
                },
                child:  Text('Go to Settings',style: AppStyles.bold14Black,),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }
}