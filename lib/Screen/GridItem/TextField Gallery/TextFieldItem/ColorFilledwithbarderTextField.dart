import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ColorFilledwithbarderTextField extends StatelessWidget {
  String title;
  ColorFilledwithbarderTextField({super.key,this.title ='TextField with Border'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 3.w,left: 2.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              borderTextField(
                  context: context,hintText: 'Hint Text',labelText: 'Color filled basic textfield',
                  conColor: Theme.of(context).secondaryHeaderColor,
                  hintColor: Theme.of(context).hoverColor,labelColor: Theme.of(context).bottomAppBarColor
              ),
              borderTextField(
                context: context,hintText: 'Rectangle Textfield',hintColor:Theme.of(context).secondaryHeaderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget borderTextField({
    required BuildContext context,
    String? hintText,
    String? labelText,
    Color? hintColor,Color? conColor,
    Color? labelColor,
}){
    return Container(
      decoration: BoxDecoration(
        color: conColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(1.w),topRight:Radius.circular(1.w)),
      ),
      child: TextField(cursorColor: Theme.of(context).secondaryHeaderColor,
        decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 4.w,left: 2.w),
          hintText: hintText,labelText: labelText,labelStyle: TextStyle(color: labelColor),
          hintStyle: TextStyle(color: hintColor,fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Widget colorTextField({
    required BuildContext context,
}){
    return Container();
  }
}
