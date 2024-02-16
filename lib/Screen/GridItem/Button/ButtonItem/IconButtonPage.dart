import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class IconButtonPage extends StatelessWidget {
  String title;
  IconButtonPage({super.key,this.title = 'Icon Button'});

  @override
  Widget build(BuildContext context) {
    String text =
        "An icon button is a picture printed on a Material widget""\n"
        "    that reacts to touches by filling with color (ink).";
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
            Image.asset(ImagePath.buttonbgImg,fit: BoxFit.cover,height: double.infinity,),
            Padding(padding:EdgeInsets.all(1.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 2.w),
                    child: Text(text,style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 11.sp),maxLines: 2,),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w), child: Divider(height: 1.w,color: Theme.of(context).indicatorColor,),),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconButton(context: context, text: "Simple IconButton", icon: Icons.thumb_up,toastText: 'BUTTON Pressed!',),),
                  Padding(padding: EdgeInsets.only(top: 3.w), child: Divider(height: 1.w,color: Theme.of(context).indicatorColor,),),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconButton(context: context, text: "IconButton with Tooltip", icon: Icons.favorite,toastText: 'BUTTON Pressed!',),),
                  Padding(padding: EdgeInsets.only(top: 3.w), child: Divider(height: 1.w,color: Theme.of(context).indicatorColor,),),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: Center(
                      child: Column(
                        children: [
                          Text("Custom Toggle IconButton",style: TextStyle(fontSize: 12.sp),),
                          IconButton(onPressed: () {}, icon: Icon(Icons.star,color: Theme.of(context).secondaryHeaderColor,size: 5.w,))],),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget iconButton({
    required BuildContext context,
    required String text,String? toastText,
    required IconData icon,}){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        IconButton(onPressed: () {
          showToast(
            toastText,backgroundColor: Theme.of(context).primaryColorDark,
            textStyle: TextStyle(color: Theme.of(context).indicatorColor),
            position: StyledToastPosition.top,textAlign: TextAlign.left,
            context: context,alignment: Alignment.topLeft,fullWidth: true,
          );
        }, icon: Icon(icon,color: Theme.of(context).secondaryHeaderColor,size: 5.w,))
      ],
    );
  }
}
