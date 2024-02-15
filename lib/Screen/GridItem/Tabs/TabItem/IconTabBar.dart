import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class IconTabBar extends StatefulWidget {
   String title;
   IconTabBar({super.key,this.title = 'Icon Tab'});

  @override
  State<IconTabBar> createState() => _IconTabBarState();
}

class _IconTabBarState extends State<IconTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        bottom:   TabBar(tabs: [
          Tab(icon: Image.asset(IconPath.tabIconImg4,fit: BoxFit.cover,height: 5.w,),),
          Tab(icon: Image.asset(IconPath.tabIconImg5,fit: BoxFit.cover,height: 5.w,)),
          Tab(icon: Image.asset(IconPath.tabIconImg6,fit: BoxFit.cover,height: 5.w,))],
          controller: _tabController,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).bottomAppBarColor,
          unselectedLabelColor:Theme.of(context).primaryColorDark,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: SafeArea(
        child: TabBarView(controller: _tabController,
          children: [
            scrollTabs(ImagePath.tabImg16, 'First'),
            scrollTabs(ImagePath.tabImg17, 'Second'),
            scrollTabs(ImagePath.tabImg18, 'Third'),
          ],
        ),
      ),
    );
  }

  scrollTabs(String img,String title){
    return Stack(
      children: [
        Container(
          width: double.infinity,height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    img,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
              )
          ),
          child: Center(
            child: Text(
              title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 18.sp),
            ),
          ),
        ),
      ],
    );
  }
}
