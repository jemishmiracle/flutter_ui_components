import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomTabBar extends StatefulWidget {
   String title;
   CustomTabBar({super.key,this.title = 'Custom View Tab'});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
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
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        bottom: TabBar(tabs: [
          Row(children: [Image.asset(IconPath.tabIconImg7,fit: BoxFit.cover,height: 3.w,),SizedBox(width: 2.w,),Text('One'),],),
          Row(children: [ Image.asset(IconPath.tabIconImg8,fit: BoxFit.cover,height: 3.w,),SizedBox(width: 2.w,),Text('Two'),],),
          Row(children: [Image.asset(IconPath.tabIconImg9,fit: BoxFit.cover,height: 3.w,),SizedBox(width: 2.w,),Text('Three'),],),
        ],
          controller: _tabController,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).bottomAppBarColor,
          unselectedLabelColor:Theme.of(context).primaryColorDark,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: TabBarView(controller: _tabController,
          children: [
            scrollTabs(ImagePath.tabImg19, 'First'),
            scrollTabs(ImagePath.tabImg20, 'Second'),
            scrollTabs(ImagePath.tabImg21, 'Third'),
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
