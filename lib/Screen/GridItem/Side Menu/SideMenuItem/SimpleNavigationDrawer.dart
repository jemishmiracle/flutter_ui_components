import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:sizer/sizer.dart';

class SimpleNavigationDrawer extends StatefulWidget {
  String title;
  SimpleNavigationDrawer({super.key,this.title = 'Navigation Drawer'});

  @override
  State<SimpleNavigationDrawer> createState() => _SimpleNavigationDrawerState();
}

class _SimpleNavigationDrawerState extends State<SimpleNavigationDrawer> {
  List<Widget>  view = [
    Row(children: [Image.asset(IconPath.bottmMenuIconImg14,fit: BoxFit.cover,height: 7.w,),SizedBox(width: 2.w,),Text("Home",style: TextStyle(color: Colors.white,fontSize: 22.sp),)],),
    Row(children: [Image.asset(IconPath.bottmMenuIconImg18,fit: BoxFit.cover,height: 7.w,),SizedBox(width: 2.w,),Text("Favorites",style: TextStyle(color: Colors.white,fontSize: 22.sp),)],),
    Row(children: [Image.asset(IconPath.sideMenuIconImg16,fit: BoxFit.cover,height: 7.w,),SizedBox(width: 2.w,),Text("Music",style: TextStyle(color: Colors.white,fontSize: 22.sp),)],),
    Row(children: [Image.asset(IconPath.sideMenuIconImg15,fit: BoxFit.cover,height: 7.w,),SizedBox(width: 2.w,),Text("Videos",style: TextStyle(color: Colors.white,fontSize: 22.sp),)],),
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Stack(
            children: [
              Image.asset(ImagePath.buttonbgImg,fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
              SizedBox(width: double.infinity,
                child: DrawerHeader(decoration: BoxDecoration(color: Theme.of(context).secondaryHeaderColor,),
                  child:Container(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 35,
                            child: ClipOval(
                                child: Image.asset(ImagePath.catImg1,fit: BoxFit.cover,height: 35.w,))),
                        SizedBox(height: 2.w,),
                        Text("Header", style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.w600),),
                        Text("Header detail", style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding:EdgeInsets.only(top: 45.w),
                child: Row(
                  children: [
                    SideNavigationBar(
                        selectedIndex: selectIndex,
                        items: [
                          SideNavigationBarItem(icon: Icons.home, label: 'Home'),
                          SideNavigationBarItem(icon: Icons.favorite, label: 'Favorites'),
                          SideNavigationBarItem(icon: Icons.music_note, label: 'Music'),
                          SideNavigationBarItem(icon: Icons.videocam, label: 'Videos'),
                        ],
                        onTap: (value) {setState(() {selectIndex = value;});},
                     initiallyExpanded: true,
                      theme: SideNavigationBarTheme(
                        itemTheme: SideNavigationBarItemTheme(
                            iconSize: 4.h,
                            selectedItemColor: Theme.of(context).primaryColorDark,
                            unselectedItemColor: Theme.of(context).bottomAppBarColor
                        ),
                        togglerTheme:  SideNavigationBarTogglerTheme(expandIconColor: Colors.transparent,shrinkIconColor: Colors.transparent,),
                        dividerTheme:  SideNavigationBarDividerTheme(
                          showHeaderDivider: false,
                          showMainDivider: false,
                          showFooterDivider: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(child: backgroundView(context: context,img: ImagePath.bgimge15),),
    );
  }

  Widget backgroundView({
    required BuildContext context,String? img}){
    return Stack(children: [
        Container(height: double.infinity,width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.w),
              image: DecorationImage(image: AssetImage(img ?? ""), fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken))),
          child: Padding(padding: EdgeInsets.only(left: 35.w), child: view.elementAt(selectIndex),),
        ),
      ],
    );
  }
}

