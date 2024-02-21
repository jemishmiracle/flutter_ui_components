import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FirebasePhoneAuthentication extends StatelessWidget {
  String title;
  FirebasePhoneAuthentication({super.key,this.title = 'Phone Authentication'});

  @override
  Widget build(BuildContext context) {
    String text =
        "    We'll send an SMS message to verify your""\n"
        "identity, please enter your number right below!";
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
            Image.asset(ImagePath.socialBgImg,fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
            SingleChildScrollView(
              child: Padding(padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 30.w),
                child: Container(color: Theme.of(context).primaryColorDark,height: 35.h,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 3.w,left: 2.w),
                        child:Text(text,maxLines: 2,style: TextStyle(fontSize: 12.sp),),),
                      Padding(padding: EdgeInsets.all(2.w),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Phone',labelStyle: TextStyle(color: Theme.of(context).bottomAppBarColor),
                            hintText: '+12 1234567890',hintStyle: TextStyle(color: Theme.of(context).hoverColor),
                            icon: Icon(Icons.call,color: Theme.of(context).bottomAppBarColor,size: 5.w,),
                            enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).dividerColor))
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5.w),
                        child: ElevatedButton(
                          child: Text('Done',style: TextStyle(color: Theme.of(context).primaryColorDark),),onPressed: (){},
                          style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(double.infinity,6.h)),
                            shadowColor: MaterialStatePropertyAll(Theme.of(context).bottomAppBarColor),
                            backgroundColor: MaterialStatePropertyAll(Theme.of(context).secondaryHeaderColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
