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
          padding: EdgeInsets.only(top: 3.w,left: 2.w,right: 2.w,bottom: 3.w),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                borderTextField(
                    context: context,hintText: 'Hint Text',labelText: 'Color filled basic textfield',
                    conColor: Theme.of(context).secondaryHeaderColor,
                    hintColor: Theme.of(context).hoverColor,labelColor: Theme.of(context).bottomAppBarColor
                ),
                Padding(padding: EdgeInsets.only(top: 2.w),
                  child: colorTextField(context: context,hintText: 'Rectangle Textfield',
                      hintColor: Theme.of(context).secondaryHeaderColor,radius: 1.w),
                ),
                Padding(padding: EdgeInsets.only(top: 2.w),
                  child: colorTextField(
                      context: context,
                      radius: 1.w,labelText: 'Rectangle Textfield with Label',labelColor: Theme.of(context).secondaryHeaderColor,),
                ),
                Padding(padding: EdgeInsets.only(top: 2.w),
                  child: colorTextField(
                      context: context,
                      radius: 20.w,hintText: 'Rounded Textfield',hintColor: Theme.of(context).secondaryHeaderColor
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.w),
                  child: colorTextField(
                      context: context,
                      radius: 5.w,labelColor: Theme.of(context).secondaryHeaderColor,
                      labelText: 'Rounded Textfield with label',hintText: 'Rounded Textfield with label',
                      hintColor:Theme.of(context).hoverColor,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.w),
                  child: colorTextField(
                      context: context,
                      radius: 5.w,labelText: 'colored border',hintText: 'Tell us about yourself',
                      labelColor: Theme.of(context).secondaryHeaderColor,hintColor: Theme.of(context).hoverColor,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.w),
                  child: borderTextField(
                      context: context,conColor: Theme.of(context).secondaryHeaderColor,
                       labelText: 'Color filled textfield',labelColor: Theme.of(context).bottomAppBarColor,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.w),
                  child: colorTextField(padding: EdgeInsets.only(left: 2.w),
                    context: context,radius: 20.w,conColor: Theme.of(context).secondaryHeaderColor,
                    hintText: 'Color filled rounded textfield',
                    hintColor: Theme.of(context).bottomAppBarColor
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 4.w),
                  child: textArea(
                      context: context,
                      radius: 1.w,labelText: 'Text Area',labelColor: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ],
            ),
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
    Color? labelColor,}){
    return Container(
      decoration: BoxDecoration(
        color: conColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(1.w),topRight:Radius.circular(1.w)),
      ),
      child: TextField(cursorColor: Theme.of(context).secondaryHeaderColor,
        decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 4.w,left: 2.w),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).splashColor),
          ),
          hintText: hintText,labelText: labelText,labelStyle: TextStyle(color: labelColor),
          hintStyle: TextStyle(color: hintColor,fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Widget colorTextField({
    required BuildContext context,EdgeInsets? padding,
    double? radius,String? labelText,Color? labelColor,
    String? hintText, Color? hintColor,Color? conColor,}){
    return Container(padding: padding,
      decoration: BoxDecoration(
        color: conColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(1.w),topRight:Radius.circular(1.w)),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).splashColor)
          ),
          hintText: hintText,hintStyle: TextStyle(color: hintColor,fontWeight: FontWeight.normal),
          labelText: labelText,labelStyle: TextStyle(color: labelColor)
        ),
      ),
    );
  }

  Widget textArea({
    required BuildContext context,
    double? radius,String? labelText,Color? labelColor,}){
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).splashColor),
        ),
        labelText: labelText,labelStyle: TextStyle(color: labelColor),
      ),
      minLines: 2,
      maxLines: 9,style: TextStyle(color: Theme.of(context).indicatorColor),
    );
  }
}
