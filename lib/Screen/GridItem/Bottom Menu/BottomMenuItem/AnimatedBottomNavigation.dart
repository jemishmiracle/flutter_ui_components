import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnimatedBottomNavigation extends StatefulWidget {
  String title;
  AnimatedBottomNavigation({super.key,this.title = 'Bottom Bar Animation'});

  @override
  State<AnimatedBottomNavigation> createState() => _AnimatedBottomNavigationState();
}

class _AnimatedBottomNavigationState extends State<AnimatedBottomNavigation> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
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
      body: SafeArea(
        child: Center(
          child: Text("Animated Bottom Bar."),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Icon( Icons.home,size: 4.w,),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.people,size: 4.w),
              label: 'People'
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.favorite,size: 4.w),
              label: 'Favorite'
          ),

        ],
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        backgroundColor:Colors.cyan,
        showSelectedLabels: true,
        selectedItemColor: Colors.red,
      ),
    );
  }
}
