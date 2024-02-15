import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:flutter_ui_components/Route/Routes.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ButtonsPage extends StatelessWidget {
   String title;
   ButtonsPage({super.key,this.title = 'Button Gallery'});

  @override
  Widget build(BuildContext context) {
    List buttonList = ["Elevated Button with basic property","Elevated Button","Outline Button","Floating Action Button","Icon Button","Dropdown Button","Selection Control"];

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
              Padding(padding:  EdgeInsets.all(5.w),
                child: Container(
                  height: 72.h,
                  child:ListView.builder(
                    itemCount: buttonList.length,shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:  EdgeInsets.all(2.w),
                        child: InkWell(
                          onTap: () {
                            switch(index){
                              case 0:
                                Get.toNamed(Routes.elevatedButtonwithbasicpropertyScreen);
                                break;
                              case 1:
                                Get.toNamed(Routes.elevatedButtonScreen);
                                break;
                              case 2:
                                Get.toNamed(Routes.outlineButtonScreen);
                                break;
                              case 3:
                                Get.toNamed(Routes.floatingActionbuttonScreen);
                                break;
                              case 4:
                                Get.toNamed(Routes.iconButtonScreen);
                                break;
                              case 5:
                                Get.toNamed(Routes.dropdownButtonScreen);
                                break;
                              case 6:
                                Get.toNamed(Routes.selectionControlScreen);
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
                                buttonList[index],
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
