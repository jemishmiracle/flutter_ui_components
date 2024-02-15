import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:flutter_ui_components/Route/Routes.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreenPage extends StatelessWidget {
   String title;
   SplashScreenPage({super.key,this.title = 'Splash Screen'});

  @override
  Widget build(BuildContext context) {
    List splashList = ["Simple Splash Screen","Animated Splash Screen","Gradiant Splash Screen"];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
              Padding(padding: EdgeInsets.all(5.w),
                child: Container(
                  height: 72.h,
                  child:ListView.builder(
                    itemCount: splashList.length,shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(2.w),
                        child: InkWell(
                          onTap: () {
                            switch(index){
                              case 0:
                                Get.toNamed(Routes.simpleSplashScreen);
                                break;
                              case 1:
                                Get.toNamed(Routes.animatedSplashScreen);
                                break;
                              case 2:
                                Get.toNamed(Routes.gradiantSplashScreen);
                                break;
                            }
                          },
                          child: Container(width: 80.w,height: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.w),
                              image: DecorationImage(
                                image: AssetImage(ImagePath.conImg,),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                splashList[index],
                                style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
