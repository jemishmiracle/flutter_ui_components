import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SimpleSplashScreen extends StatefulWidget {
  SimpleSplashScreen({super.key});

  @override
  State<SimpleSplashScreen> createState() => _SimpleSplashScreenState();
}

class _SimpleSplashScreenState extends State<SimpleSplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() {
      Get.back();
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.center,
          children: [
            Image.asset(ImagePath.tabImg7,fit: BoxFit.cover,width: double.infinity,),
            Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 28.sp,fontWeight: FontWeight.w600),),
                  Image.asset(ImagePath.dialogImg,fit: BoxFit.cover,height: 20.h,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
