import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextPage extends StatelessWidget {
  String title;
  TextPage({super.key,this.title = 'Text Gallery'});

  @override
  Widget build(BuildContext context) {

    List colorList = [
      Text("Green",style: TextStyle(color: Theme.of(context).backgroundColor),),
      Text("Red",style: TextStyle(color: Theme.of(context).dividerColor),),
      Text("Blue",style: TextStyle(color: Theme.of(context).disabledColor),),
      Text("Custom Color",style: TextStyle(color: Theme.of(context).dialogBackgroundColor),),
    ];

    List sizeList = [
      Padding(padding: EdgeInsets.only(top: 5.w),
        child: Text("12.0",style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 10.sp),),
      ),SizedBox(width: 5.w,),
      Padding(padding: EdgeInsets.only(top: 4.w),
        child: Text("14.0",style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 11.sp),),
      ),SizedBox(width: 5.w,),
      Padding(padding: EdgeInsets.only(top: 3.w),
        child: Text("16.0",style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 12.sp),),
      ),SizedBox(width: 5.w,),
      Padding(padding: EdgeInsets.only(top: 3.w),
        child: Text("18.0",style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 13.sp),),
      ),SizedBox(width: 5.w,),
      Padding(padding: EdgeInsets.only(top: 2.w),
        child: Text("20.0",style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 14.sp),),
      ),SizedBox(width: 5.w,),
      Padding(padding: EdgeInsets.only(top: 2.w),
        child: Text("22.0",style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 15.sp),),
      ),SizedBox(width: 5.w,),
      Padding(padding: EdgeInsets.only(top: 2.w),
        child: Text("24.0",style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 16.sp),),
      ),
    ];

    List fontStyleList = [
      Text("Normal",style: TextStyle(color:Theme.of(context).canvasColor,fontWeight: FontWeight.normal,fontSize: 14.sp),),SizedBox(width: 2.w,),
      Text("Bold",style: TextStyle(color:Theme.of(context).canvasColor,fontWeight: FontWeight.bold,fontSize: 14.sp),),SizedBox(width: 2.w,),
      Text("Italic",style: TextStyle(color:Theme.of(context).canvasColor,fontStyle: FontStyle.italic,fontSize: 14.sp),),SizedBox(width: 2.w,),
      Text("line Through",style: TextStyle(color:Theme.of(context).canvasColor,decoration: TextDecoration.lineThrough,fontSize: 14.sp),),SizedBox(width: 2.w,),
      Text("overLine",style: TextStyle(color:Theme.of(context).canvasColor,decoration: TextDecoration.overline,fontSize: 14.sp),),SizedBox(width: 2.w,),
      Text("underline",style: TextStyle(color:Theme.of(context).canvasColor,decoration: TextDecoration.underline,fontSize: 14.sp),),
    ];

    String text =
        "-This is long Text line which handle by TextOverflow.clip property""\n""\v"
        "-Text line which handle by TextOverflow.ellipsis property""\n""\v"
        "-Text line which handle by TextOverflow.fade property";

    List fontFamilyList = [
      Text("Raleway",style: TextStyle(fontFamily:GoogleFonts.raleway().fontFamily,color: Theme.of(context).canvasColor,fontSize: 14.sp),),
      Text("Roboto",style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily,color: Theme.of(context).canvasColor,fontSize: 14.sp),),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(padding: EdgeInsets.all(2.w),
          child: Stack(
            children: [
              Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
              Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("String form Basic Text",style: TextStyle(color: Theme.of(context).bottomAppBarColor),),
                    SizedBox(height: 1.w,),
                    Divider(height: 1,color: Theme.of(context).secondaryHeaderColor,),
                    SizedBox(height: 2.w,),
                    Text("--> Color Property",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    Row(
                      children: List.generate(colorList.length, (index) =>
                          Container(padding: EdgeInsets.all(1.w),
                            child: colorList[index],
                          )
                      ),
                    ),
                    Divider(height: 1,color: Theme.of(context).secondaryHeaderColor,),
                    SizedBox(height: 2.w,),
                    Text("--> Size Property",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    Row(
                      children: List.generate(sizeList.length, (index) => Container(child: sizeList[index],)),
                    ),
                    Divider(height: 1,color: Theme.of(context).secondaryHeaderColor,),
                    SizedBox(height: 2.w,),
                    Text("--> FontStyle",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    SizedBox(height: 1.w,),
                    Wrap(
                      children: List.generate(fontStyleList.length, (index) =>
                          Container(
                            child: fontStyleList[index],
                          )
                      ),
                    ),
                    SizedBox(height: 1.w,),
                    Divider(height: 1,color: Theme.of(context).secondaryHeaderColor,),
                    SizedBox(height: 2.w,),
                    Text("--> Custom FontFamily",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    SizedBox(height: 1.w,),
                    Row(
                      children: List.generate(fontFamilyList.length, (index) =>
                          Container(padding: EdgeInsets.all(1.w),
                            child: fontFamilyList[index],
                          )
                      ),
                    ),
                    SizedBox(height: 2.w,),
                    Divider(height: 1,color: Theme.of(context).secondaryHeaderColor,), SizedBox(height: 2.w,),
                    Text("--> Overflow Property",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    Padding(
                      padding: EdgeInsets.only(left: 1.w,top: 2.w,bottom: 5.w),
                      child: Text(
                       text,overflow: TextOverflow.clip,style: TextStyle(color: Theme.of(context).canvasColor,fontSize: 10.sp),
                      ),
                    ),
                    Divider(height: 1,color: Theme.of(context).secondaryHeaderColor,), SizedBox(height: 2.w,),
                    Text("--> TextSpan Property",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    SizedBox(height: 1.w,),
                    RichText(
                      text: const TextSpan(
                        text: "Hello ",
                          children: [
                            TextSpan(
                                text: "beautiful ",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 18)
                            ),
                            TextSpan(
                                text: "world",
                                style: TextStyle(fontWeight: FontWeight.bold)
                            ),
                          ],
                          style: TextStyle(
                            color: Colors.black,
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
