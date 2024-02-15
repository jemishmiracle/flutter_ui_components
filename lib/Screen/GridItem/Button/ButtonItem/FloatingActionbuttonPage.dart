import 'package:flutter/material.dart';
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
                        borderRadius: 20.w,
                        title: "Icon Floating Action Button",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: labelFloatingActionButton(
                        context: context,
                        text: "Add",
                        borderRadius: 20.w,
                        title: "Label Floating Action Button",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: rectangleBorderButton(
                        context: context,
                        borderRadius: 20.w,
                        title: "Circle Border",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconFloatingActionButton(
                        context: context,iconColor: Theme.of(context).primaryColorDark,
                        borderRadius: 2.w,
                        title: "Rounded Rectangle Border",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconFloatingActionButton(
                        context: context,iconColor: Theme.of(context).bottomAppBarColor,borderRadius: 2.w,
                        title: "Icon Color",),
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.w),
                    child: iconLabelFloatingActionButton(
                        context: context,
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
    required String title,
    double? borderRadius,
    Color? iconColor,}){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        CircleAvatar(radius: 6.w,backgroundColor: Colors.transparent,
          child: FloatingActionButton(
              onPressed: () {},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              child:Icon(Icons.edit,color:iconColor,size: 6.w,),
          ),
        ),
      ],
    );
  }

  Widget labelFloatingActionButton({
    required BuildContext context,
    required String text,
    required String title,
    double? borderRadius}){
     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        CircleAvatar(radius: 6.w,backgroundColor: Colors.transparent,
          child: FloatingActionButton(
            onPressed: () {},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            child:Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark),),
          ),
        ),
      ],
    );
  }

  Widget rectangleBorderButton({
    required BuildContext context,
    required String title,
    double? borderRadius}){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        CircleAvatar(radius: 6.w,backgroundColor: Colors.transparent,
          child: FloatingActionButton(
            onPressed: () {},shape: RoundedRectangleBorder(
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
    required String title,
    required String text,}){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 12.sp),),
        Row(
          children: [
            SizedBox(height: 6.h,width: 23.w,
              child: FloatingActionButton(
                onPressed: () {},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
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
                onPressed: () {},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
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
