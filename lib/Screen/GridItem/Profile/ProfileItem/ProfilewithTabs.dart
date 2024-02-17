import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../Constants/ImagePath.dart';

class ProfilewithTabs extends StatefulWidget {

  @override
  State<ProfilewithTabs> createState() => _ProfilewithTabsState();
}

class _ProfilewithTabsState extends State<ProfilewithTabs> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    List profileData = [
      SizedBox(height: 9.h,
        child: Column(children: [Text("Photos",style: TextStyle(color: Theme.of(context).bottomAppBarColor),), Text("160",style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.bold),)],),),
      SizedBox(height: 9.h,
        child: Column(children: [Text("Followers",style: TextStyle(color: Theme.of(context).bottomAppBarColor),), Text("1543",style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.bold),)],),),
      SizedBox(height: 9.h,
        child: Column(children: [Text("Following",style: TextStyle(color: Theme.of(context).bottomAppBarColor),), Text("250",style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.bold),)],),),
    ];

    List<ProfileTabData> profileTabList = [
      ProfileTabData(img: IconPath.profileIconImg4, title: "Mobile", text: "+91 6584839202"),
      ProfileTabData(img: IconPath.profileIconImg6, title: "Work", text: "+91 9984659240"),
      ProfileTabData(img: IconPath.profileIconImg3, title: "Email", text: "meganAllison@gmail.com"),
    ];
    
    List<ProfilePostData> postList = [
      ProfilePostData(time: "36m ago", img: ImagePath.pageViewImg1,),
      ProfilePostData(time: "1h ago", img: ImagePath.pageViewImg2,),
      ProfilePostData(time: "3h ago", img: ImagePath.pageViewImg3,),
      ProfilePostData(time: "2 days ago", img: ImagePath.pageViewImg4,),
      ProfilePostData(time: "5 days ago", img: ImagePath.pageViewImg5,),
    ];
    
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,scrollDirection: Axis.vertical,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          [ SliverAppBar(
            expandedHeight: 49.h,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(height: 38.h, color: Theme.of(context).secondaryHeaderColor,),
                  Padding(
                    padding: EdgeInsets.only(top: 20.w),
                    child: Align(alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 6.h,
                        backgroundImage: AssetImage(ImagePath.perImg5,),
                      ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(top: 42.w),
                    child: Align(alignment: Alignment.topCenter,
                        child: Text("Megan Allison",style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp),)),
                  ),
                  Padding(
                    padding:EdgeInsets.only(top: 50.w),
                    child: Align(alignment: Alignment.topCenter,
                        child: Text("Traveller, Dreamer, Photographer",
                          style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 10.sp),)),),
                  Padding(padding: EdgeInsets.only(top: 58.w,left: 2.w,right: 2.w),
                    child: Container(
                      height: 10.h,
                      width: double.infinity,padding: EdgeInsets.all(2.w),
                      child: Row(
                        children: List.generate(profileData.length, (index) =>
                            Padding(padding: EdgeInsets.only(left: 12.w,top: 2.w,),
                              child: Container(child: profileData[index],),)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding:EdgeInsets.only(top: 75.w),
                      child: TabBar(
                        controller: tabController,
                        labelStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                        tabs: [Tab(text: "ABOUT",),Tab(text: "POSTS",)],
                      ),
                  ),
                ],),
            ),
            snap: true,pinned: true,floating: true,
          ),],
          body:TabBarView(controller: tabController,
            children: [
              Padding(padding:  EdgeInsets.all(3.w),
                child: Column(
                  children: [
                    Container(height: 31.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.w),
                        boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 1.0,blurStyle: BlurStyle.outer)],
                      ),
                      child: ListView.builder(
                          itemCount: profileTabList.length,physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(backgroundColor: Colors.transparent,
                                  child: Image.asset(profileTabList[index].img,fit: BoxFit.cover,height: 5.w,)),
                              title: Text(profileTabList[index].title,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 13.sp),),
                              subtitle: Text(profileTabList[index].text,style: TextStyle(fontSize: 11.sp),),
                            );
                          },
                      ),
                    ),
                    Padding(padding:EdgeInsets.only(top: 2.w),
                      child: Container(
                        height: 11.h,width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.w),
                          boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 1.0,blurStyle: BlurStyle.outer)],
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 5.w,top: 3.w),
                              child: Text("Status",style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 13.sp),),
                            ),
                            Padding(padding:EdgeInsets.only(top: 1.w,left: 5.w),
                              child: Text("Available",style: TextStyle(fontSize: 11.sp),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                    itemCount: postList.length,shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                         padding:EdgeInsets.all(5.w),
                          child:post(postList[index].time, postList[index].img),
                      );
                    },
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
  Widget post(String text,String img){
    return Container(
      height: 38.h,width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.w),
        color: Theme.of(context).secondaryHeaderColor
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: EdgeInsets.symmetric(vertical: 1.w),
            child: ListTile(
              leading: CircleAvatar(radius: 6.w,backgroundImage: AssetImage(ImagePath.perImg5),),
              title: Text("Megan Alison"),
              subtitle: Text(text,style: TextStyle(color: Theme.of(context).primaryColorDark),),
              trailing: Icon(Icons.more_vert,size: 6.w,color: Theme.of(context).primaryColorDark,),
            )
          ),
          Image.asset(img,fit: BoxFit.cover,width: double.infinity,height: 20.h,),
          Container(padding: EdgeInsets.only(top: 3.w,left: 3.w),
            child: Row(
              children: [
                Image.asset(IconPath.bottmMenuIconImg10,fit: BoxFit.cover,height: 5.w,),SizedBox(width: 2.w,),
                Text("54",style: TextStyle(fontSize: 11.sp),),SizedBox(width: 2.w,),
                Image.asset(IconPath.dialogsIconImg,fit: BoxFit.cover,height: 5.w,),SizedBox(width: 2.w,),
                Text("16",style: TextStyle(fontSize: 11.sp),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTabData{
  String img;
  String title;
  String text;

  ProfileTabData({
    required this.img,
    required this.title,
    required this.text,
  });
}

class ProfilePostData{
  String time;
  String img;
  
  ProfilePostData({
    required this.time,
    required this.img,
 });
}