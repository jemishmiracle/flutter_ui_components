import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TitledBottomBar extends StatefulWidget {
  String title;
  TitledBottomBar({super.key,this.title = 'Titled Bottom Bar'});

  @override
  State<TitledBottomBar> createState() => _TitledBottomBarState();
}

class _TitledBottomBarState extends State<TitledBottomBar> {
  int selectIndex = 0;

  void onItemTapped(int index){
    setState(() {selectIndex = index;});
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
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Image.asset(IconPath.bottomappbarIconImg1,fit: BoxFit.cover,height: 6.w,), label: 'Home'),
          BottomNavigationBarItem(icon: Image.asset(IconPath.bottomappbarIconImg2,fit: BoxFit.cover,height: 6.w,), label: 'Search'),
          BottomNavigationBarItem(icon: Image.asset(IconPath.bottomappbarIconImg3,fit: BoxFit.cover,height: 6.w,), label: 'Bag'),
          BottomNavigationBarItem(icon: Image.asset(IconPath.bottomappbarIconImg4,fit: BoxFit.cover,height: 6.w,), label: 'Orders'),
          BottomNavigationBarItem(icon: Image.asset(IconPath.bottomappbarIconImg5,fit: BoxFit.cover,height: 6.w,), label: 'Profile'),
        ],
        onTap: onItemTapped,
        backgroundColor:Theme.of(context).primaryColorDark,
        currentIndex: selectIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).indicatorColor,
      ),
    );
  }
}
