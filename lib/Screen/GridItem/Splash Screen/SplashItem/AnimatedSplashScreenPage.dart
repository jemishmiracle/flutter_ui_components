import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:flutter_ui_components/Screen/GridItem/Splash%20Screen/SplashScreenPage.dart';
import 'package:sizer/sizer.dart';

class AnimatedSplashScreenPage extends StatefulWidget {
  AnimatedSplashScreenPage({super.key});

  @override
  State<AnimatedSplashScreenPage> createState() => _AnimatedSplashScreenPageState();
}

class _AnimatedSplashScreenPageState extends State<AnimatedSplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(ImagePath.dialogImg,fit: BoxFit.cover,height: 25.h,),
          Text("Welcome",style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 28.sp,fontWeight: FontWeight.w600),)
        ],
      ),
      splashIconSize: 60.w, duration: 3000,
      backgroundColor: Color(0xffF59526),
      splashTransition: SplashTransition.scaleTransition,
      nextScreen: SplashScreenPage(), centered: true,
      animationDuration:  Duration(seconds: 3),
    );
  }
}
