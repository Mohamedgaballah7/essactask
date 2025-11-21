
import 'package:flutter/material.dart';
import 'package:task2/utils/app_colors.dart';
import 'package:task2/utils/app_styles.dart';

class DialogMessage{
  static void showLoadingMessage({required BuildContext context,required String text}){
    showDialog(
      context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(color: AppColors.primaryLight,),
                SizedBox(width: 10,),
                Text(text,style: AppStyles.medium14Primary,)
              ],
            ),
          );
        },
    );
  }
  static void hideLoadingMessage({required BuildContext context}){
    Navigator.of(context).pop();
  }
  static void showMessage({
    required BuildContext context,
    required String message,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
    String? title,
    bool barrierDismissible=true,
  }){
    List<Widget>?actions=[];
    if(posActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.of(context).pop();
        posAction?.call();
      },
          child: Text(posActionName,style: AppStyles.medium14Primary,)));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.of(context).pop();
        negAction?.call();
      },
          child: Text(negActionName,style: AppStyles.medium14Primary,)));
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title??'',style: AppStyles.bold16Primary,),
          content: Text(message,style: AppStyles.medium14Primary,),
          actions: actions,
        );
      },
    );
  }
}