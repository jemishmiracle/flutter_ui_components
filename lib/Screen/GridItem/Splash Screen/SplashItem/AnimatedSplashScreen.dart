import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class AnimatedSplashScreen extends StatefulWidget {
   AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {@override
// void initState() {
//   // Future.delayed(Duration(seconds: 5),() {
//   //   Get.back();
//   // },);
//   super.initState();
// }
double angel = 0;

@override
void initState() {
  Timer.periodic(Duration(seconds: 6,), (timer) {
    setState(() {
      ++angel;
    });
  });
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.center,
          children: [
            Image.asset(ImagePath.tabImg7,fit: BoxFit.cover,width: double.infinity,),
             // AnimatedContainer(
             //     duration: Duration(seconds: 3),
             //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
             //       children: [
             //         Image.asset(ImagePath.dialogImg,fit: BoxFit.cover,height: 20.h,),
             //         Text("Welcome",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 28.sp,fontWeight: FontWeight.w600),),
             //       ],
             //     ),
             // ),
            // AnimatedCrossFade(
            //     firstChild: Image.asset(ImagePath.dialogImg,fit: BoxFit.cover,height: 20.h,),
            //     secondChild:  Text("Welcome",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 28.sp,fontWeight: FontWeight.w600),),
            //     crossFadeState: CrossFadeState.showFirst,
            //     duration:  Duration(seconds: 2),excludeBottomFocus: true,
            // )
            Transform.rotate(
              angle: angel,origin: Offset.fromDirection(2.w),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImagePath.dialogImg,fit: BoxFit.cover,height: 20.h,),
                        Text("Welcome",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 28.sp,fontWeight: FontWeight.w600),),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
