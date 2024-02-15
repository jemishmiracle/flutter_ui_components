import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class ProgressBarsPage extends StatelessWidget {
  String title;
  ProgressBarsPage({super.key,this.title = 'Progress Indicator Gallery'});

  @override
  Widget build(BuildContext context) {
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
            Padding(padding: EdgeInsets.all(3.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  progressIndicator(
                      context: context,
                      conHeight: 10.h,
                      title: "Linear Progress Indicator"),
                  Padding(padding: EdgeInsets.only(top: 2.w,),
                    child: circularProgressIndicator(
                        context: context,
                        conHeight: 15.h,
                        title: "Circular Progress Indicator"),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.w,),
                    child: customCircular(
                        context: context,
                        conHeight: 27.h,
                        title: "Custom Circular Percentage Indicator", text: '70%'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget progressIndicator({
    required BuildContext context,
    required double conHeight,
    required String title,}){
    return Container(
      height: conHeight,decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor,borderRadius: BorderRadius.circular(1.w)),
      child: Column(
        children: [
          Padding(padding:EdgeInsets.only(top: 2.w),
              child: Center(child: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp),))),
          Padding(padding:EdgeInsets.only(top: 2.w),
            child: LinearProgressIndicator(
              color: Theme.of(context).toggleableActiveColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget circularProgressIndicator({
    required BuildContext context,
    required double conHeight,
    required String title,}){
    return Container(
      height: conHeight,decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor,borderRadius: BorderRadius.circular(1.w)),
      child: Column(
        children: [
          Padding(padding:EdgeInsets.only(top: 2.w),
              child: Center(child: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp),))),
          Padding(padding:EdgeInsets.only(top: 2.w,left: 1.w),
            child: Row(
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).toggleableActiveColor,strokeWidth:2,),SizedBox(width: 10.w,),
                CircularProgressIndicator(color: Theme.of(context).dividerColor,strokeWidth:4,),SizedBox(width: 10.w,),
                CircularProgressIndicator(color: Theme.of(context).toggleableActiveColor,strokeWidth:6,),SizedBox(width: 10.w,),
                CircularProgressIndicator(color: Theme.of(context).highlightColor,strokeWidth:8,),SizedBox(width: 10.w,),
                CircularProgressIndicator(color: Theme.of(context).toggleableActiveColor,strokeWidth:10,backgroundColor: Theme.of(context).primaryColorDark,),
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget customCircular({
    required BuildContext context,
    required double conHeight,
    required String title,
    required String text}){
    return Container(
      height: conHeight,decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor,borderRadius: BorderRadius.circular(1.w)),
      child: Column(
        children: [
          Padding(padding:EdgeInsets.only(top: 2.w),
              child: Center(child: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp),))),
          Padding(padding:EdgeInsets.only(top: 4.w),
            child: Center(
              child: CircularPercentIndicator(
                  radius: 15.w,
                  lineWidth: 7.0,
                  percent: 0.70,
                  center:  Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.bold,fontSize: 14.sp),),progressColor: Theme.of(context).dialogBackgroundColor,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  rotateLinearGradient: true, circularStrokeCap: CircularStrokeCap.round),
            )
          ),
        ],
      ),
    );
  }

  Widget customProgressBar({
    required BuildContext context,
}){return Container();}
}
