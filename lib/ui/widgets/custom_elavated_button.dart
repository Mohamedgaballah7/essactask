
import 'package:flutter/material.dart';
import 'package:task2/utils/app_colors.dart';
import 'package:task2/utils/app_styles.dart';

class CustomElavatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String textName;
  Color? backgroundColor;
  Color? borderColor;
  TextStyle? textStyle;
  bool isIcon;
  MainAxisAlignment? mainAxisAlignment;
  Widget? iconName;
   CustomElavatedButton({super.key,
     required this.onPressed,
     required this.textName,
     this.isIcon=false,
     this.iconName,
     this.mainAxisAlignment,
     this.textStyle,
     this.backgroundColor,
     this.borderColor
   });

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.01,
        horizontal: width * 0.025,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: backgroundColor??AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(width*0.035),
              side: BorderSide(width: 1.5,
                  color: borderColor??AppColors.primaryLight)
            )
          ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: height*0.02),
              child:isIcon?Row(
                mainAxisAlignment: mainAxisAlignment?? MainAxisAlignment.center,
                children: [
                iconName!,
                SizedBox(width: width*0.02,),
                Text(textName,
                  style: textStyle??AppStyles.bold16White,),
              ],): Text(textName,
                style: textStyle??AppStyles.bold16White,),
            ),
        ),
      ),
    );
  }
}
