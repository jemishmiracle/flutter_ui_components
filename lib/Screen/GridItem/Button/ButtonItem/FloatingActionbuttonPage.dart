import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FloatingActionbuttonPage extends StatelessWidget {
  String title;
  FloatingActionbuttonPage({super.key,this.title = 'Floating Action Button'});

  @override
  Widget build(BuildContext context) {
    String text =
        " A floating action button is a circular icon button that""\n"
        "hovers over content to promote a primary action in the""\n"
        "                                    application.";
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
            Padding(padding:  EdgeInsets.all(1.w),
              child: Column(
                children: [
                  Padding(padding:  EdgeInsets.only(top: 2.w),
                    child: Text(text,maxLines: 3,style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 11.sp),),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w), child: Divider(height: 1.w,color: Theme.of(context).indicatorColor,),),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconFloatingActionButton(
                        context: context,iconColor: Theme.of(context).primaryColorDark,
                        borderRadius: 20.w,toastText: 'BUTTON Pressed!',
                        title: "Icon Floating Action Button",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: labelFloatingActionButton(
                        context: context,
                        text: "Add",toastText: 'BUTTON Pressed!',
                        borderRadius: 20.w,
                        title: "Label Floating Action Button",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: rectangleBorderButton(
                        context: context,
                        borderRadius: 20.w,toastText: 'BUTTON Pressed!',
                        title: "Circle Border",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconFloatingActionButton(
                        context: context,iconColor: Theme.of(context).primaryColorDark,
                        borderRadius: 2.w,toastText: 'BUTTON Pressed!',
                        title: "Rounded Rectangle Border",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconFloatingActionButton(
                        context: context,toastText: 'BUTTON Pressed!',
                      iconColor: Theme.of(context).bottomAppBarColor,borderRadius: 2.w,
                        title: "Icon Color",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconLabelFloatingActionButton(
                        context: context,toastText: 'Edit Pressed!',
                        title: "Icon with Label",
                        text: "Edit",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconFloatingActionButton({
    required BuildContext context,
    required String title,String? toastText,
    double? borderRadius,
    Color? iconColor,}){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        CircleAvatar(radius: 6.w,backgroundColor: Colors.transparent,
          child: FloatingActionButton(
              onPressed: () {
                showToast(
                  toastText,backgroundColor: Theme.of(context).primaryColorDark,
                  textStyle: TextStyle(color: Theme.of(context).indicatorColor),
                  position: StyledToastPosition.top,textAlign: TextAlign.left,
                  context: context,alignment: Alignment.topLeft,fullWidth: true,
                );
              },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              child:Icon(Icons.edit,color:iconColor,size: 6.w,),
          ),
        ),
      ],
    );
  }

  Widget labelFloatingActionButton({
    required BuildContext context,
    required String text,String? toastText,
    required String title,
    double? borderRadius}){
     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        CircleAvatar(radius: 6.w,backgroundColor: Colors.transparent,
          child: FloatingActionButton(
            onPressed: () {
              showToast(
                toastText,backgroundColor: Theme.of(context).primaryColorDark,
                textStyle: TextStyle(color: Theme.of(context).indicatorColor),
                position: StyledToastPosition.top,textAlign: TextAlign.left,
                context: context,alignment: Alignment.topLeft,fullWidth: true,
              );
            },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            child:Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark),),
          ),
        ),
      ],
    );
  }

  Widget rectangleBorderButton({
    required BuildContext context,
    required String title,String? toastText,
    double? borderRadius}){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        CircleAvatar(radius: 6.w,backgroundColor: Colors.transparent,
          child: FloatingActionButton(
            onPressed: () {
              showToast(
                toastText,backgroundColor: Theme.of(context).primaryColorDark,
                textStyle: TextStyle(color: Theme.of(context).indicatorColor),
                position: StyledToastPosition.top,textAlign: TextAlign.left,
                context: context,alignment: Alignment.topLeft,fullWidth: true,
              );
            },shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
               side: BorderSide(color: Theme.of(context).bottomAppBarColor)
          ),
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            child:Icon(Icons.edit,color: Theme.of(context).primaryColorDark,size: 6.w,),
          ),
        ),
      ],
    );
  }

  Widget iconLabelFloatingActionButton({
    required BuildContext context,
    required String title,String? toastText,
    required String text,}){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        Row(
          children: [
            SizedBox(height: 6.h,width: 23.w,
              child: FloatingActionButton(
                onPressed: () {
                  showToast(
                    toastText,backgroundColor: Theme.of(context).primaryColorDark,
                    textStyle: TextStyle(color: Theme.of(context).indicatorColor),
                    position: StyledToastPosition.top,textAlign: TextAlign.left,
                    context: context,alignment: Alignment.topLeft,fullWidth: true,
                  );
                },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child:Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit,color:Theme.of(context).primaryColorDark,size: 6.w,),SizedBox(width: 2.w,),
                    Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 10.sp),)
                  ],
                ),
              ),
            ),SizedBox(width: 3.w,),
            SizedBox(height: 6.h,width: 23.w,
              child: FloatingActionButton(
                onPressed: () {
                  showToast(
                    toastText,backgroundColor: Theme.of(context).primaryColorDark,
                    textStyle: TextStyle(color: Theme.of(context).indicatorColor),
                    position: StyledToastPosition.top,textAlign: TextAlign.left,
                    context: context,alignment: Alignment.topLeft,fullWidth: true,
                  );
                },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child:Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit,color:Theme.of(context).primaryColorDark,size: 6.w,),SizedBox(width: 2.w,),
                    Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 10.sp),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
