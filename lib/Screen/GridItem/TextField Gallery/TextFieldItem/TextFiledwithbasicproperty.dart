import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TextFiledwithbasicproperty extends StatelessWidget {
  String title;
  TextFiledwithbasicproperty({super.key,this.title = 'Basic TextField'});

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
      body: Padding(padding: EdgeInsets.only(left: 2.w,top: 3.w,right: 2.w,bottom: 3.w),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textField(
                  context: context, obscureText: false,
                  hintText: 'Hint Text',hintColor: Theme.of(context).secondaryHeaderColor),
              textField(
                  context: context,obscureText: false,
                  hintText: 'Hint Text',labelText: 'Label Text',hintColor: Theme.of(context).hoverColor),
              textField(
                  context: context,
                  hintText: 'Hint Text',obscureText: false,
                  labelText: 'Textfield with helper-text',
                  hintColor: Theme.of(context).hoverColor,
                 helperText: 'This is helper text',helperTextColor: Theme.of(context).bottomAppBarColor
              ),
              textField(
                  context: context,obscureText: false,
                  hintText: 'Hint Text',
                  labelText: 'Textfield with error text',
                  hintColor: Theme.of(context).hoverColor,
                 errorText: 'This is error text',errorTextColor: Theme.of(context).dividerColor
              ),
              textField(
                  context: context,obscureText: false,
                  hintText: 'Contact Number',
                  labelText: 'Textfield with prefix text',
                  hintColor: Theme.of(context).hoverColor,keyboardType: TextInputType.phone,
                  prefixText: '+1',prefixTextColor: Theme.of(context).secondaryHeaderColor
              ),
              textField(
                  context: context,obscureText: false,
                  hintText: 'Monthly Income',
                  labelText: 'Textfield with Suffix text',
                  hintColor: Theme.of(context).hoverColor,keyboardType: TextInputType.number,
                  prefixText: 'Rs:',prefixTextColor: Theme.of(context).hoverColor,suffixText: 'INR'
              ),
              textField(
                  context: context,obscureText: true,
                  hintText: 'Password *',
                  labelText: 'Label Text',
                  hintColor: Theme.of(context).hoverColor,textLength: 8,
                  helperText: 'No more than 8 characters.',helperTextColor: Theme.of(context).indicatorColor,
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
    );
  }

  Widget textField({
    required BuildContext context,
    String? hintText, String? labelText,
    String? helperText, String? errorText,
    String? prefixText, String? suffixText,
    Color? hintColor, required bool obscureText,Color? errorTextColor,
    Color? helperTextColor, int? textLength,Color? borderColor,
    TextInputType? keyboardType, Color? prefixTextColor,}){
    return TextField(
      cursorColor: Theme.of(context).secondaryHeaderColor,
      decoration: InputDecoration(
        hintText: hintText,hintStyle: TextStyle(color: hintColor,fontWeight: FontWeight.normal),
        helperText: helperText,errorText: errorText,helperStyle: TextStyle(color: helperTextColor),
        labelText: labelText,labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        prefix: Text(prefixText ?? "",style: TextStyle(color: prefixTextColor,fontSize: 10.sp),),
        suffix: Text(suffixText ?? ""),errorStyle: TextStyle(color: errorTextColor),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).splashColor),),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor),),
      ),keyboardType: keyboardType,maxLength: textLength,obscureText:obscureText,
    );
  }

  Widget textArea({
    required BuildContext context,
    double? radius,String? labelText,Color? labelColor,}){
    return TextField(
      decoration: InputDecoration(
       border: InputBorder.none,
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
