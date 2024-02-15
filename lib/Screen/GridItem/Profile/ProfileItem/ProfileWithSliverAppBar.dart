import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../../../Constants/ImagePath.dart';

class ProfileWithSliverAppBar extends StatelessWidget {
  String title;
  ProfileWithSliverAppBar({super.key,this.title = 'Owen Davey'});

  @override
  Widget build(BuildContext context) {

    List<ProfileDetails> profileList = [
      ProfileDetails(img: ImagePath.perImg1, title: "Alina Khurana", subtext: "Summer event with all friends", place: "At Dehradun"),
      ProfileDetails(img: ImagePath.perImg2, title: "Piya Jeshval", subtext: "Memorable collage Events", place: "At Mount Collage"),
      ProfileDetails(img: ImagePath.perImg3, title: "Misha Dobriyal", subtext: "Celebrate Dance Event day", place: "At Mount Collage"),
      ProfileDetails(img: ImagePath.perImg4, title: "Abhay Raichand", subtext: "Boxing Match Event", place: "At Mount Collage"),
    ];

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,scrollDirection: Axis.vertical,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          [ SliverAppBar(
            expandedHeight: 35.h,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
            flexibleSpace: FlexibleSpaceBar(centerTitle: true,titlePadding: EdgeInsets.only(right: 5.w,bottom: 4.w),
              title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 12.sp,fontWeight: FontWeight.w600),),
              background: Image.asset(ImagePath.perImg5,fit: BoxFit.cover,),
            ),
            snap: true,pinned: true,floating: true,
          ),],
          body:Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: profileList.length,
                itemBuilder: (context, index) {
                  return ProfileData(context, profileList[index].img, profileList[index].title,  profileList[index].subtext,  profileList[index].place);
                },
            ),
          ),
        ),
      ),
    );
  }
  Widget ProfileData(BuildContext context,String img,String title,String subtext,String place){
    return Padding(padding:EdgeInsets.only(top: 1.w,left: 1.w,bottom: 2.w,right: 1.w),
      child: Container(
        height: 30.h,width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.w),
          boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 1.0,blurStyle: BlurStyle.outer)],
        ),
        child: Column(
          children: [
            Container(padding: EdgeInsets.all(3.w),
              child: Row(
                children: [
                  Image.asset(img,fit: BoxFit.cover,height: 33.w,),SizedBox(width: 3.w,),
                  Container(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,style: TextStyle(color: Theme.of(context).indicatorColor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                        Text(subtext,style: TextStyle(color: Theme.of(context).focusColor,fontSize: 10.sp),),
                        Text(place,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 15.sp,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(height: 1.w,color: Theme.of(context).cardColor,),
            Padding(padding:EdgeInsets.only(top: 3.w,left: 3.w),
              child: Row(
                children: [
                  Image.asset(IconPath.profileIconImg2,fit: BoxFit.cover,height: 5.w,),SizedBox(width: 1.w,),
                  Expanded(
                      child: Text("Reviews",style: TextStyle(color: Theme.of(context).cardColor),)),
                  Expanded(child: SizedBox(width: 1.w,height: 3.h,child: VerticalDivider(width: 1,color: Theme.of(context).cardColor,))),
                  Image.asset(IconPath.profileIconImg5,fit: BoxFit.cover,height: 5.w,),SizedBox(width: 1.w,),
                  Text("Logistics",style: TextStyle(color: Theme.of(context).cardColor),),
                  Expanded(flex: 1,
                      child: SizedBox(width: 1.w,height: 3.h,child: VerticalDivider(width: 1,color:Theme.of(context).cardColor,))),
                  Padding(padding:EdgeInsets.only(right: 2.w),
                    child: Icon(Icons.more_horiz,size: 5.w,color: Theme.of(context).secondaryHeaderColor,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetails{
  String img;
  String title;
  String subtext;
  String place;

  ProfileDetails({
    required this.img,
    required this.title,
    required this.subtext,
    required this.place,
});
}
