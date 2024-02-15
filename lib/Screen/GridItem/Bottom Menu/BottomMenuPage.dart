import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:flutter_ui_components/Route/Routes.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BottomMenuPage extends StatelessWidget {
   String title;
   BottomMenuPage({super.key,this.title = 'Bottom Navigation Bar'});

  @override
  Widget build(BuildContext context) {
    List navigationList = ["Simple Bottom Navigation","Animated Bottom Navigation","Material Bottom Navigation"];

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
                    itemCount: navigationList.length,shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(2.w),
                        child: InkWell(
                          onTap: () {
                            switch(index){
                              case 0:
                                Get.toNamed(Routes.simpleBottomNavigationScreen);
                                break;
                              case 1:
                                Get.toNamed(Routes.animatedBottomNavigationScreen);
                                break;
                              case 2:
                                Get.toNamed(Routes.materialBottomNavigationScreen);
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
                                navigationList[index],
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
