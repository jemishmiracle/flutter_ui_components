import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GradiantSplashScreen extends StatefulWidget {

  @override
  State<GradiantSplashScreen> createState() => _GradiantSplashScreenState();
}

class _GradiantSplashScreenState extends State<GradiantSplashScreen> {
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x95E98929), Colors.white,Color(0x95E98929)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.repeated
            )
          ),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagePath.dialogImg,fit: BoxFit.cover,height: 20.h,),
                Text("Gradiant Splash Screen",style: TextStyle(fontSize:20.sp,color: Theme.of(context).primaryColorDark),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
