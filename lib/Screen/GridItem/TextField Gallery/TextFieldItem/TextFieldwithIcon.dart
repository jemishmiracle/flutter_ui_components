import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TextFieldwithIcon extends StatelessWidget {
  String title;
  TextFieldwithIcon({super.key,this.title = 'TextField with Icon'});

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
          padding: EdgeInsets.all(1.w),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconLabelTextField(context: context,img: IconPath.textfiledIconImg1, hintText:'Hint Text',labelText: 'Label Text'),
                iconTextField(context: context, labelText: 'Prefix Icon',prefixIcon: Icons.alarm,prefixColor: Theme.of(context).secondaryHeaderColor),
                iconTextField(
                    context: context,padding: EdgeInsets.zero,textAlign: TextAlign.start,
                    labelText: 'Suffix Icon',suffixIcon: Icons.alarm,suffixColor: Theme.of(context).secondaryHeaderColor),
                iconTextField(
                    context: context,labelText: 'Color Icon',prefixIcon: Icons.alarm,prefixColor: Theme.of(context).dividerColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconLabelTextField({
    required BuildContext context,
    String? hintText,
    required String img,
    String? labelText,
}){
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,hintStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 11.sp),
        labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 11.sp),labelText: labelText,
        icon: Image.asset(img,fit: BoxFit.cover,height: 3.w,),
      ),
    );
  }

  Widget iconTextField({
    required BuildContext context,
    IconData? prefixIcon,
    Color? prefixColor,
    IconData? suffixIcon,
    TextAlign? textAlign,
    TextCapitalization? textCapitalization,
    EdgeInsets? padding,
    Color? suffixColor,
    String? labelText,
}){
    return TextFormField(
      textInputAction: TextInputAction.next,
      textAlign: textAlign ?? TextAlign.center,
      decoration: InputDecoration(contentPadding: padding,
        labelText: labelText,labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 11.sp),
        prefixIcon: Icon(prefixIcon,size: 5.w,color: prefixColor,),
        suffixIcon:  Icon(suffixIcon,size: 5.w,color: suffixColor,),
      ),
    );
  }
}
