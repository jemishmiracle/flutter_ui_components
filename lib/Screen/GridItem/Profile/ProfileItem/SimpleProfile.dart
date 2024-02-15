import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SimpleProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List profileData = [
      SizedBox(height: 9.h,
        child: Column(children: [Text("Photos"), Text("160",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.bold),)],),),
      SizedBox(height: 9.h,
        child: Column(children: [Text("Followers"), Text("1543",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.bold),)],),),
      SizedBox(height: 9.h,
        child: Column(children: [Text("Following"), Text("250",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.bold),)],),),
    ];

    List<ProfileData> profileList = [
      ProfileData(img: IconPath.profileIconImg3, name: "something@gmail.com"),
      ProfileData(img: IconPath.profileIconImg4, name: "+91 6543235465"),
      ProfileData(img: IconPath.profileIconImg1, name: "Add to Group"),
      ProfileData(img: IconPath.profileIconImg2, name: "Show all Comments"),
    ];
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(height: 38.h, color: Theme.of(context).secondaryHeaderColor,),
            Align(alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 9.w),
              child: Align(alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 6.h,
                  backgroundImage: AssetImage(ImagePath.perImg5,),
                ),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top: 33.w),
              child: Align(alignment: Alignment.topCenter,
                  child: Text("My Profile",style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp),)),
            ),
            Padding(padding: EdgeInsets.only(top: 58.w,left: 2.w,right: 2.w),
              child: Container(
                height: 10.h,
                width: double.infinity,padding: EdgeInsets.all(2.w),
                decoration:BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(1.w),
                  boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 3.0,blurStyle: BlurStyle.outer)],
                ),
                child: Row(
                  children: List.generate(profileData.length, (index) =>
                      Padding(
                        padding: EdgeInsets.only(left: 12.w,top: 2.w,),
                        child: Container(
                          child: profileData[index],
                        ),
                      )
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 85.w,left: 5.w),
              child: Container(height :30.h,
                  child: ListView.builder(
                      itemCount: profileList.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CircleAvatar(child: Image.asset(profileList[index].img,fit: BoxFit.cover,height: 5.w,), backgroundColor: Colors.transparent,),
                            Text(profileList[index].name,style: TextStyle(fontSize: 14.sp),),
                          ],
                        );
                      },
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 110.w,),
              child: Center(
                child: SizedBox(width: 40.w,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).secondaryHeaderColor)),
                        child: Text("Follow Me",style: TextStyle(color: Theme.of(context).primaryColorDark),))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileData {
  String img;
  String name;

  ProfileData({
    required this.img,
    required this.name,
  });
}