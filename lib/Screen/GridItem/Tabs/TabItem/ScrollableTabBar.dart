import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScrollableTabBar extends StatefulWidget {
   String title;
   ScrollableTabBar({super.key,this.title = 'Scrollable Tab Demo'});

  @override
  State<ScrollableTabBar> createState() => _ScrollableTabBarState();
}

class _ScrollableTabBarState extends State<ScrollableTabBar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 9, vsync: this);
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
        bottom: TabBar(tabs: [Tab(text: 'First',), Tab(text: 'Second',),Tab(text: 'Third',),Tab(text: 'Four',),Tab(text: 'Five',),Tab(text: 'Six',),Tab(text: 'Seven',),Tab(text: 'Eight',),Tab(text: 'Nine',)],
          controller: _tabController,isScrollable: true,tabAlignment: TabAlignment.start,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).bottomAppBarColor,
          unselectedLabelColor:Theme.of(context).primaryColorDark,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: SafeArea(
        child: TabBarView(controller: _tabController,
          children: [
            scrollTabs(ImagePath.tabImg4, 'First'),
            scrollTabs(ImagePath.tabImg5, 'Second'),
            scrollTabs(ImagePath.tabImg6, 'Third'),
            scrollTabs(ImagePath.tabImg7, 'Four'),
            scrollTabs(ImagePath.tabImg8, 'Five'),
            scrollTabs(ImagePath.tabImg9, 'Six'),
            scrollTabs(ImagePath.tabImg10, 'Seven'),
            scrollTabs(ImagePath.tabImg11, 'Eight'),
            scrollTabs(ImagePath.tabImg12, 'Nine'),
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
