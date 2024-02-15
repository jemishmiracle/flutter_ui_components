import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ElevatedButtonwithbasicproperty extends StatelessWidget {
   String title;
   ElevatedButtonwithbasicproperty({super.key,this.title ='Flat Button'});

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
            SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 2.w),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        allButton(
                            context: context,
                            conWidth: 31.w,conHeight: 5.h,
                            borderRadius: 1.w,
                            text:"FLAT BUTTON",
                            buttonColor: Theme.of(context).secondaryHeaderColor),
                        SizedBox(width: 2.w,),
                        iconButton(context: context, text: "FLAT BUTTON"),
                      ],
                    ),
                  ),
                  Padding(
                      padding:EdgeInsets.only(top: 3.w),
                      child: disableButton(
                          context: context,
                          text: "DISABLE BUTTON",
                         disableButtons: buttonenabled,
                      ),
                  ),
                  Padding(
                      padding:EdgeInsets.only(top: 3.w),
                    child: disableIconButton(
                      context: context,
                      text: "DISABLE BUTTON",
                      disableButtons: buttonenabled,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 3.w),
                      child: allButton(
                          context: context,
                          conWidth: 36.w,conHeight: 5.h,
                          text: "Rectangle border",
                          borderRadius: 1.w,
                          buttonColor: Theme.of(context).secondaryHeaderColor,
                      ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 3.w),
                      child:roundedBorderButton(
                          context: context,
                          conWidth: 35.w,
                          text:  "Rounded border",textSize: 11.sp,
                          borderColor: Theme.of(context).primaryColorDark,
                          buttonColor: Theme.of(context).secondaryHeaderColor,
                          borderRadius: 20.w,
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: roundedBorderButton(
                      context: context,
                      conWidth: 50.w,
                      text: "Rounded Colored border",textSize: 11.sp,
                      borderRadius: 2.w,
                      buttonColor: Theme.of(context).secondaryHeaderColor,
                      borderColor: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: roundedBorderButton(
                      context: context,
                      conWidth: 50.w,
                      text: "Rounded Colored border",textSize: 11.sp,
                      borderRadius: 2.w,
                      buttonColor: Theme.of(context).secondaryHeaderColor,
                      borderColor: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: roundedBorderButton(
                      context: context,
                      conWidth: 42.w,
                      text: "Text Style of Label",textSize: 13.sp,
                      borderRadius: 2.w,textStyle: FontStyle.italic,
                      buttonColor: Theme.of(context).secondaryHeaderColor,
                      borderColor: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: allButton(
                      context: context,
                      conWidth: 50.w,conHeight: 5.h,
                      text: "fill color rectangle button",
                      borderRadius: 1.w,
                      buttonColor: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: roundedBorderButton(
                      context: context,
                      conWidth: 48.w,
                      text: "fill color round button",
                      borderRadius: 20.w,
                      buttonColor: Theme.of(context).secondaryHeaderColor,
                      borderColor: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: allButton(
                      context: context,
                      conWidth: 55.w,
                      text: "Rectangle Gradient",
                      conHeight: 6.h,
                      gradientColor: LinearGradient(
                          colors: [Theme.of(context).shadowColor,Theme.of(context).indicatorColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          tileMode: TileMode.repeated
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: allButton(
                      context: context,
                      conWidth: 55.w,
                      text: "Rounded Gradient",conRadius:20.w,
                      conHeight: 6.h,
                        gradientColor: LinearGradient(
                            colors: [Theme.of(context).shadowColor,Theme.of(context).indicatorColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            tileMode: TileMode.repeated
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget allButton({
    required BuildContext context,
    required double conWidth,
    required String text,
    double? conHeight,
    Color? buttonColor,
    Gradient? gradientColor,
    double? conRadius,
    double? borderRadius,}) {
    return Container(
        height:conHeight,width:conWidth,
        decoration: BoxDecoration(gradient: gradientColor,borderRadius: BorderRadius.circular(conRadius ?? 0)),
        child: TextButton(
            onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(buttonColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
              )),
            ),
            child: Text(text, style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 11.sp),))
    );
  }

  Widget roundedBorderButton({
    required BuildContext context,
    required double conWidth,
    required String text,
    required Color borderColor,
    Color? buttonColor,
    FontStyle? textStyle,
    double? textSize,
    double? borderRadius,}){
    return Container(
        height: 5.h,width:conWidth,
        child: TextButton(
            onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(buttonColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 0),side: BorderSide(color:borderColor)
              )),
            ),
            child: Text(text, style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize:textSize,fontStyle:textStyle ),))
    );
  }

   Widget iconButton({
    required BuildContext context,
    required String text,}) {
    return Container(
        height: 5.h, width: 38.w,
        child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Theme.of(context).secondaryHeaderColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.w),)),),
            child: Row(children: [
                Icon(Icons.account_balance, color: Theme.of(context).primaryColorDark, size: 5.w,), SizedBox(width: 2.w,),
                Text(text, style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 11.sp)),],)));
    }

  Widget disableButton({
    required BuildContext context,
    required String text,
    required bool disableButtons,}) {
    return Container(
        height: 5.h,width:37.w,
        child: TextButton(
            onPressed: disableButtons ? (){} :null,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Theme.of(context).selectedRowColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.w),
              )),
            ),
            child: Text(text,style: TextStyle(fontSize: 11.sp),),)
    );
  }

  Widget disableIconButton({
    required BuildContext context,
    required String text,
    required bool disableButtons,}){
    return Container(
        height: 5.h,width:44.w,
        child: TextButton(
            onPressed: disableButtons ? (){} :null,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Theme.of(context).selectedRowColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.w),
              )),
            ),
            child: Row(
              children: [
                Icon(Icons.account_balance,size: 5.w,),SizedBox(width: 2.w,),
                Text(text,style: TextStyle(fontSize: 11.sp),),
              ],
            ))
    );
  }
}
