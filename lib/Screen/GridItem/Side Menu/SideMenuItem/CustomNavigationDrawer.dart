import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class CustomNavigationDrawer extends StatelessWidget {
  String title;
  CustomNavigationDrawer({super.key,this.title = 'THE NAVIGATION DEMO'});

  @override
  Widget build(BuildContext context) {
    List<NavigationData> navigationList = [
      NavigationData(img: ImagePath.foodImg1,icon:IconPath.sideMenuIconImg7,title:"il domacca", text: '78 5TH AVENUE, YORK'),
      NavigationData(img: ImagePath.foodImg2,icon:IconPath.sideMenuIconImg8,title:"Mc Grady", text: '79 5TH AVENUE, YORK'),
      NavigationData(img: ImagePath.foodImg3,icon:IconPath.sideMenuIconImg9,title:"Sugar & Spice", text: '80 5TH AVENUE, YORK'),
      NavigationData(img: ImagePath.foodImg4,icon:IconPath.sideMenuIconImg10,title:"South Indian", text: '81 5TH AVENUE, YORK'),
    ];

    return Scaffold(
      appBar:AppBar(
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600,),),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: navigationList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 20.h,width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                  ),
                  child: Column(
                    children: [
                      Image.asset(navigationList[index].img,fit: BoxFit.cover,height: 10.h,),
                      ListTile(
                        leading: Image.asset(navigationList[index].icon,fit: BoxFit.cover,height: 3.w,),
                        title: Text(navigationList[index].title,style: TextStyle(fontSize: 16.sp),),
                        subtitle: Text(navigationList[index].text,style: TextStyle(fontSize: 13.sp),),
                        trailing: Icon(Icons.favorite_border,size: 2.w,color: Theme.of(context).dividerColor,)
                      ),
                    ],
                  ),
                );
              },),
        ),
      ),
    );
  }
}

class NavigationData{
  String img;
  String icon;
  String title;
  String text;

  NavigationData({
    required this.img,
    required this.icon,
    required this.title,
    required this.text,
});
}