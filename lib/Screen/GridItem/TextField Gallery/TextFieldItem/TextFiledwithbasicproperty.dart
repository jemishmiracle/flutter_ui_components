import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TextFiledwithbasicproperty extends StatelessWidget {
  String title;
  TextFiledwithbasicproperty({super.key,this.title = 'Basic TextField'});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Padding(padding: EdgeInsets.only(left: 1.w),
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
                 errorText: 'This is error text',
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
             /* Padding(padding: EdgeInsets.only(top: 2.w),
                child: textField(
                    context: context,obscureText: false,controller: controller,minLine: 4,
                    labelText: 'Multiline TextArea',keyboardType: TextInputType.multiline
                ),
              ),*/
              // Padding(padding: EdgeInsets.only(top: 2.w),
              //   child: textArea(
              //       labelText: 'Multiline TextArea',
              //       context: context,
              //       controller: controller,
              //       keyboardType: TextInputType.multiline, minLine: 4, maxLine: 6),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField({
    required BuildContext context,
    String? hintText,
    String? labelText,
    String? helperText,
    String? errorText,
    String? prefixText,
    String? suffixText,
    Color? hintColor,
    int? minLine,
    int? maxLine,
    TextEditingController? controller,
    required bool obscureText,
    Color? helperTextColor,
    int? textLength,
    TextInputType? keyboardType,
    Color? prefixTextColor,}){
    return TextField(
      cursorColor: Theme.of(context).secondaryHeaderColor,
      decoration: InputDecoration(
        hintText: hintText,hintStyle: TextStyle(color: hintColor,fontWeight: FontWeight.normal),
        helperText: helperText,errorText: errorText,helperStyle: TextStyle(color: helperTextColor),
        labelText: labelText,labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        prefix: Text(prefixText ?? "",style: TextStyle(color: prefixTextColor,fontSize: 10.sp),),
        suffix: Text(suffixText ?? ""),
      ),keyboardType: keyboardType,maxLength: textLength,obscureText:obscureText,
      minLines: minLine,maxLines: maxLine,
    );
  }

  Widget textArea({
    required labelText,
    required BuildContext context,
    required TextEditingController? controller,
    required TextInputType? keyboardType,
    required minLine,required maxLine,}){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText:labelText,labelStyle: TextStyle(color: Theme.of(context).secondaryHeaderColor),
      ),
      keyboardType: keyboardType,minLines: minLine,maxLines: maxLine,
    );
  }
}
