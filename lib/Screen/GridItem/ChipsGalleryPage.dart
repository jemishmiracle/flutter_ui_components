import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../Constants/ImagePath.dart';

class ChipsGalleryPage extends StatefulWidget {
   String title;
   ChipsGalleryPage({super.key,this.title = 'Chips Gallery'});

  @override
  State<ChipsGalleryPage> createState() => _ChipsGalleryPageState();
}

class _ChipsGalleryPageState extends State<ChipsGalleryPage> {
  String title1 =
      "Chips are compact elements that represent an input,""\n"
      "                            attribute,or action.";

  String subText =
      "Input chips represent information used in fields, such as an""\n"
      "entity or different attributes.";

  String subText1 =
      "Action chips trigger actions related to primary content.";

  String subText2 =
      "Select your favorite fruits";

  String subText3 =
      "Filter chips represent filters for a collection.";

  String subText4 =
      "Select one item";

  String subText5 =
      "In sets that contain at least two options, choice chips""\n"
      "represent a single selection.";

  List<String> fruits = ["Apple","Orange","Banana","Mango","Grape","Pear","Cherry"];
  List<String> select = [];
  String item = '';
  List<String> itemList = ["item 0","item 1","item 2"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body:SafeArea(
        child: Container(padding: EdgeInsets.all(2.w),
          child: Stack(
            children: [
              Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text(title1,style: TextStyle(color: Theme.of(context).focusColor,fontSize: 11.sp),),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 4.w,right: 4.w),
                      child: Divider(height: 1.w,color: Theme.of(context).secondaryHeaderColor,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.w),
                      child: Text("--> InputChips",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    ),
                    Center(
                      child: Container(height: 26.h,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 4.w),
                              child: InputChips(conColor: Theme.of(context).toggleableActiveColor, title: "Smith Jhan", conWidth:36.w, context: context, iconColor: Theme.of(context).bottomAppBarColor,conBorderRadius: 20.w),
                            ),
                            InputChips(conColor: Theme.of(context).toggleableActiveColor, title: "InputChip Label", conWidth:44.w,context: context, iconColor: Theme.of(context).bottomAppBarColor,conBorderRadius: 1.w),
                            Padding(padding: EdgeInsets.only(left: 4.w),
                              child: InputChips(conColor: Theme.of(context).secondaryHeaderColor, title: "Smith Jhan", conWidth:36.w,context: context, textColor: Theme.of(context).primaryColorDark, iconColor: Theme.of(context).primaryColorDark,conBorderRadius: 20.w),
                            ),
                            InputChips(conColor: Theme.of(context).secondaryHeaderColor, title: "InputChip Label", conWidth:44.w,context: context, textColor: Theme.of(context).primaryColorDark, iconColor: Theme.of(context).primaryColorDark,conBorderRadius: 1.w),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w,right: 2.w),
                      child: Text(subText,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 9.sp),),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 5.w,right: 4.w,top: 2.w),
                      child: Divider(height: 1.w,color: Theme.of(context).secondaryHeaderColor,),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.w),
                      child: Text("--> ActionChips",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),
                    ),
                    Center(
                      child: Container(
                        height: 13.h,width: 75.w,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ActionChips(conBorderRadius: 20.w, context: context, image: IconPath.chipIconImg1, title: "ActionChip"),
                                  ActionChips(conBorderRadius: 1.w, context: context, image: IconPath.chipIconImg2, title: "Set Alarm"),],),),
                            Container(
                              child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ActionChips(conBorderRadius: 20.w, context: context, image: IconPath.chipIconImg4, title: "Save Date",textColor: Theme.of(context).hintColor),
                                  ActionChips(conBorderRadius: 1.w, context: context, image: IconPath.chipIconImg3, title: "Set Alarm",textColor: Theme.of(context).disabledColor),],),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w,right: 2.w),
                      child: Text(subText1,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 10.sp),),),
                    Padding(
                      padding:EdgeInsets.only(left: 5.w,right: 4.w,top: 2.w),
                      child: Divider(height: 1.w,color: Theme.of(context).secondaryHeaderColor,),),
                    Padding(
                      padding: EdgeInsets.only(top: 2.w),
                      child: Text("--> FilterChips",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),),
                    Text(subText2,),
                    Padding(padding:EdgeInsets.symmetric(vertical: 2.w),
                      child: Wrap(spacing: 1.w,runSpacing: 2.w,
                        children: List.generate(fruits.length, (index) =>
                            Container(height: 5.h,width: 22.w,
                              child: ChoiceChip(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
                                label: Text(fruits[index],style: TextStyle(fontSize: 10.sp),),
                                side: BorderSide.none, backgroundColor: Theme.of(context).toggleableActiveColor,
                                showCheckmark: true,selectedColor: Theme.of(context).backgroundColor,
                                selected: select.contains(fruits[index]),
                                onSelected: (value) {
                                  setState(() {if(select.contains(fruits[index])){select.remove(fruits[index]);}
                                    else{select.add(fruits[index]);}});},
                              ),
                            ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w,right: 2.w),
                      child: Text(subText3,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 10.sp),),),
                    Padding(
                      padding:EdgeInsets.only(left: 5.w,right: 4.w,top: 2.w),
                      child: Divider(height: 1.w,color: Theme.of(context).secondaryHeaderColor,),),
                    Padding(
                      padding: EdgeInsets.only(top: 2.w),
                      child: Text("--> ChoiceChips",style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 15.sp),),),
                    Text(subText4,),
                    Wrap(spacing: 2.w,
                      children: List.generate(itemList.length, (index) =>
                          ChoiceChip(
                            label: Text(itemList[index]), side: BorderSide.none,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
                            backgroundColor: Theme.of(context).errorColor,
                            showCheckmark: false,selectedColor: Theme.of(context).backgroundColor,
                            selected: item == itemList[index],
                            onSelected: (value) {setState(() {item = itemList[index];});},),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w,right: 2.w),
                      child: Text(subText5,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 10.sp),),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget InputChips({
     required BuildContext context,
     required Color conColor,
      Color? textColor,
     required Color iconColor,
     required String title,
     required double conWidth,
     required double conBorderRadius,
 }) {
    return Padding(padding:EdgeInsets.symmetric(vertical: 2.w),
      child: Container(
          height: 4.h,
          width: conWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(conBorderRadius),
              color: conColor),
          child: Padding(padding:EdgeInsets.only(left: 1.w),
            child: Row(
              children: [
                CircleAvatar(backgroundColor: Theme.of(context).focusColor,radius: 3.w,),SizedBox(width: 2.w,),
                Text(title,style: TextStyle(color: textColor),),SizedBox(width: 2.w,),
                Icon(Icons.cancel, color: iconColor, size: 3.w,),
              ],
            ),
          )),
    );
  }

  Widget ActionChips({
     required double conBorderRadius,
     required BuildContext context,
     required String image,
     required String title,
     Color? textColor,
}){
    return Padding(padding:EdgeInsets.symmetric(vertical: 2.w),
      child: Container(
        height: 4.h,width: 29.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(conBorderRadius),
            color: Theme.of(context).toggleableActiveColor,),
        child: Padding(padding:EdgeInsets.only(left: 1.w),
          child: Row(
            children: [
              Image.asset(image,fit: BoxFit.cover,height: 4.w,),SizedBox(width: 2.w,),
              Text(title,style: TextStyle(color: textColor,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
