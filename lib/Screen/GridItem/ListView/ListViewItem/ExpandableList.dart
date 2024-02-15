import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ExpandableList extends StatefulWidget {
  String title;
   ExpandableList({super.key,this.title = 'Expandable Demo'});

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  List<SubData> sublist  = [
    SubData(title: "Map", img: IconPath.mapIconImg),
    SubData(title: "Album", img: IconPath.albumIconImg21),
    SubData(title: "Phone", img: IconPath.phoneIconImg),
    SubData(title: "DeskTop MAC", img: IconPath.deskTopIconImg),
  ];
  bool status = false;
  bool lakeStatus = false;
  String  subtext =
      " Lake Pichola, situated in Udaipur city in the Indian state of "
      "Rajasthan, is an artificial fresh water lake, created in the "
      "year 1362 AD, named after the nearby Piccolo village. It is "
      "one of the several contiguous lakes, and developed over the "
      "last few centuries in and around the famous Udaipur city. "
      "The lakes around Udaipur were primarily created by building "
      "dams to meet the drinking water and irrigation needs of the "
      "city and its neighborhood. Two islands, Jag Nia's and Jag "
      "Mandi are located within Pichola Lake, and have been "
      "developed with several palaces to provide views of the lake.";

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(padding: EdgeInsets.all(3.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lakePichola1(ImagePath.lakeImg1,"Lake Pichola", subtext, Icons.keyboard_arrow_up_outlined, Icons.keyboard_arrow_down_outlined,),
                SizedBox(height: 2.h,),
                lakePichola("Lake Pichola"),
                SizedBox(height: 2.h,),
                subList("Sublist", Icons.keyboard_arrow_up_outlined, Icons.keyboard_arrow_down_outlined, sublist,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget lakePichola(String title,){
    return Container(height:status ? 49.h : 37.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(1.w),
        boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 1.0,blurStyle: BlurStyle.outer)],
      ),
      child:Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 3.w),
            child: Text(title,style: TextStyle(color: Theme.of(context).shadowColor,fontSize: 40.sp),),
          ),
          status ? Padding(padding: EdgeInsets.only(bottom: 2.w,left: 2.w),
            child: Text(status ? "Lake Pichola" : "",style: TextStyle(color: Theme.of(context).primaryColor),),)
              : Container(),
          Image.asset(status ? ImagePath.lakeImg3 : ImagePath.lakeImg2 ,fit: BoxFit.fill,height: status ? 22.h : 18.h,width: double.infinity,),
          status ? Padding(padding: EdgeInsets.only(top: 2.w,left: 2.w),
            child: Text(status ? "Different views of Lake Pichola" : "",style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),)
              : Container(),
          Padding(padding: EdgeInsets.only(left: 2.w),
            child: TextButton(
              child: Text(status ? "COLLAPSE" : "EXPAND",style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),
              onPressed: () {
                setState(() {
                  status = !status;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget lakePichola1(String image,String title,String subText,IconData icon,IconData icon1){
    return Container(height: lakeStatus ? 63.h : 36.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(1.w),
        boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 1.0,blurStyle: BlurStyle.outer)],
      ),
      child: Wrap(
        children: [
          ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(2.w),topRight: Radius.circular(2.w)),
              child: Image.asset(image,fit: BoxFit.cover,width: double.infinity,height: 25.h,)),
          Padding(padding: EdgeInsets.only(left: 2.w,right: 2.w),
            child: ExpansionTile(tilePadding: EdgeInsets.zero,shape: const Border(),
              title: Text(title,style: TextStyle(color: Theme.of(context).shadowColor,fontSize: 40.sp),),
              trailing:lakeStatus
                  ? Padding(padding:  EdgeInsets.only(bottom: 12.w),
                   child: Icon(icon,size: 6.w,color: Theme.of(context).cardColor,),)
                  : Padding(padding:  EdgeInsets.only(bottom: 12.w,),
                   child: Icon(icon1,size: 6.w,color: Theme.of(context).cardColor,),),
              onExpansionChanged: (value) {
                lakeStatus = value;
                setState(() {});
              },
              children: [
                Text(subText,style: TextStyle(color: Theme.of(context).shadowColor,fontSize: 9.sp),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget subList(String title,IconData icon,IconData icon1,List<SubData> data){
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(1.w),
        boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 1.0,blurStyle: BlurStyle.outer)],
      ),
      child: ExpansionTile(shape: const Border(),
        title: Text(title,style: TextStyle(color: Theme.of(context).shadowColor),),
        trailing: status
            ? Icon(icon,size: 6.w,color: Theme.of(context).shadowColor,)
            : Icon(icon1,size: 6.w,color: Theme.of(context).cardColor,),
        onExpansionChanged: (value) {
          status = value;
          setState(() {});
        },
        children: List.generate(data.length, (index) =>
            ListTile(
              title: Text(data[index].title),
              leading: Image.asset(data[index].img,fit: BoxFit.cover,height: 4.w,),
            )
        ),
      ),
    );
  }
}

class SubData{
  String title;
  String img;

  SubData({
    required this.title,
    required this.img,
  });
}