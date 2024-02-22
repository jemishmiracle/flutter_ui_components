import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ElevatedButtonPage extends StatelessWidget {
  String title;
  ElevatedButtonPage({super.key,this.title = 'Elevated Button',});

  @override
  Widget build(BuildContext context) {
    bool buttonenabled = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
            Center(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: allElevatedButton(
                        context: context,
                        conWidth: 47.w,toastText: 'ELEVATED BUTTON Pressed!',
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                        borderRadius: 1.w,
                        text: "ELEVATED BUTTON"
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w),
                    child: allElevatedButton(
                        context: context,
                        conWidth: 46.w,toastText: 'DISABLED BUTTON Pressed!',
                        buttonColor: Theme.of(context).disabledColor,
                        borderRadius: 1.w,
                        text: "DISABLED BUTTON"
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w), child: Divider(height: 1.w,color: Theme.of(context).indicatorColor,),),
                  Padding(padding: EdgeInsets.only(top: 4.w),
                    child: roundedBorderButton(
                        context: context,
                        conWidth: 38.w,toastText: 'Outline Border ELEVATED BUTTON Pressed!',
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                        borderRadius: 1.w,
                        text: "Outline Border",
                        borderColor: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w),
                    child: allElevatedButton(
                        context: context,
                        conWidth: 43.w,toastText: 'Rectangle Border ELEVATED BUTTON Pressed!',
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                        borderRadius: 1.w,
                        text: "Rectangle Border"
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w),
                    child: allElevatedButton(
                        context: context,
                        conWidth: 41.w,toastText: 'Rounded Border ELEVATED BUTTON Pressed!',
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                        borderRadius: 20.w,
                        text: "Rounded Border"
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w), child: Divider(height: 1.w,color: Theme.of(context).indicatorColor,),),
                  Padding(padding: EdgeInsets.only(top: 4.w),
                    child: allElevatedButton(
                        context: context,
                        conWidth: 45.w,toastText: 'Rectangle fill color ELEVATED BUTTON Pressed!',
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                        borderRadius: 1.w,
                        text: "Rectangle fill color"
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w),
                    child: allElevatedButton(
                        context: context,
                        conWidth: 43.w,toastText: 'Rounded fill color ELEVATED BUTTON Pressed!',
                        buttonColor: Theme.of(context).secondaryHeaderColor,
                        borderRadius: 20.w,
                        text: "Rounded fill color"
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w), child: Divider(height: 1.w,color: Theme.of(context).indicatorColor,),),
                  Padding(padding: EdgeInsets.only(top: 4.w), child: iconButton(context: context, text: "Icon Button",toastText: 'Icon Button Pressed!',),),
                  Padding(padding: EdgeInsets.only(top: 4.w), child: disableIconButton(context: context, text: "Icon disabled button", disableButtons: buttonenabled),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget allElevatedButton({
    required BuildContext context,
    required double conWidth,
    required String text,
    Color? buttonColor,String? toastText,
    Gradient? gradientColor,
    double? conRadius,
    double? borderRadius,}) {
    return Container(
        height:5.h,width:conWidth,
        decoration: BoxDecoration(gradient: gradientColor,borderRadius: BorderRadius.circular(conRadius ?? 0)),
      child: ElevatedButton(
          onPressed: () {
            showToast(
              toastText,backgroundColor: Theme.of(context).primaryColorDark,
              textStyle: TextStyle(color: Theme.of(context).indicatorColor),
              position: StyledToastPosition.top,textAlign: TextAlign.left,
              context: context,alignment: Alignment.topLeft,fullWidth: true,
            );
          },
          style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(buttonColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            )),
           ),
          child: Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 11.sp)),),
    );
  }

  Widget roundedBorderButton({
    required BuildContext context,
    required double conWidth,
    required String text,
    required Color borderColor,
    Color? buttonColor,String? toastText,
    double? borderRadius,}){
    return Container(
        height: 5.h,width:conWidth,
      child: ElevatedButton(
        onPressed: () {
          showToast(
            toastText,backgroundColor: Theme.of(context).primaryColorDark,
            textStyle: TextStyle(color: Theme.of(context).indicatorColor),
            position: StyledToastPosition.top,textAlign: TextAlign.left,
            context: context,alignment: Alignment.topLeft,fullWidth: true,
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(buttonColor),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),side: BorderSide(color:borderColor)
          )),
        ),
        child: Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 11.sp)),),
    );
  }

  Widget disableIconButton({
    required BuildContext context,
    required String text,
    required bool disableButtons,}){
    return Container(
        height: 5.h,width:55.w,
      child: ElevatedButton(
        onPressed: disableButtons ? (){} :null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).toggleableActiveColor),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.w),
          )),
        ),
        child: Row(
          children: [
            Icon(Icons.adb,size: 5.w,),SizedBox(width: 2.w,),
            Text(text,style: TextStyle(fontSize: 11.sp)),
          ],
        ),),
    );
  }

  Widget iconButton({
    required BuildContext context,String? toastText,
    required String text,}) {
    return Container(
        height: 5.h, width: 40.w,
      child: ElevatedButton(
        onPressed: () {
          showToast(
            toastText,backgroundColor: Theme.of(context).primaryColorDark,
            textStyle: TextStyle(color: Theme.of(context).indicatorColor),
            position: StyledToastPosition.top,textAlign: TextAlign.left,
            context: context,alignment: Alignment.topLeft,fullWidth: true,
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).secondaryHeaderColor),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.w),
          )),
        ),
        child: Row(
          children: [
            Icon(Icons.adb, color: Theme.of(context).primaryColorDark, size: 5.w,), SizedBox(width: 2.w,),
            Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 11.sp)),],),),
    );
  }

}
