import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:sizer/sizer.dart';

class CollapsibleNavigationDrawer extends StatefulWidget {
  String title;
  CollapsibleNavigationDrawer({super.key,this.title = 'Collapsible Navigation Drawer'});

  @override
  State<CollapsibleNavigationDrawer> createState() => _CollapsibleNavigationDrawerState();
}

class _CollapsibleNavigationDrawerState extends State<CollapsibleNavigationDrawer> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Row(
          children: [
            SideNavigationBar(selectedIndex: selectIndex,
                items: const [
                  SideNavigationBarItem(icon: Icons.home, label: 'Dashboard'),
                  SideNavigationBarItem(icon: Icons.favorite, label: 'Favorites'),
                  SideNavigationBarItem(icon: Icons.home, label: 'Music Videos'),
                  SideNavigationBarItem(icon: Icons.notifications, label: 'Notification'),
                  SideNavigationBarItem(icon: Icons.settings, label: 'Settings'),
                ],
              onTap: (value) {setState(() {selectIndex = value;});},
              toggler: const SideBarToggler(expandIcon: Icons.menu, shrinkIcon: Icons.close,),
              header: SideNavigationBarHeader(
                image: Padding(padding:  EdgeInsets.only(bottom: 6.w,left: 4.w),
                  child: Image.asset(IconPath.bottmMenuIconImg4,height: 5.h,fit: BoxFit.cover,),),
                title: Padding(padding: EdgeInsets.only(right: 30.w),
                  child: Text("John",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark),),), subtitle: Text(""),),
              theme: SideNavigationBarTheme(
                  itemTheme: SideNavigationBarItemTheme(
                      iconSize: 6.h, selectedItemColor: Theme.of(context).secondaryHeaderColor,
                      unselectedItemColor:  Color(0xffFCDFBD), selectedBackgroundColor: Theme.of(context).bottomAppBarColor,
                      labelTextStyle: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,)),
                  togglerTheme: SideNavigationBarTogglerTheme(expandIconColor: Theme.of(context).primaryColorDark, shrinkIconColor: Theme.of(context).primaryColorDark,),
                  dividerTheme: const SideNavigationBarDividerTheme(showHeaderDivider: true, showMainDivider: false, showFooterDivider: false, headerDividerColor: Color(0xffBABABA),),
                  backgroundColor:Color(0xffF59526),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
