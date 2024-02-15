import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SimpleBottomNavigation extends StatefulWidget {
  String title;
  SimpleBottomNavigation({super.key,this.title = 'Simple Bottom Bar'});

  @override
  State<SimpleBottomNavigation> createState() => _SimpleBottomNavigationState();
}

class _SimpleBottomNavigationState extends State<SimpleBottomNavigation> {
  int selectedIndex = 0;
  static List<Widget> widgetOptions = <Widget>[
    Center(child: Icon( Icons.home,size: 15.w,)),
    Center(child: Icon( Icons.people,size: 15.w)),
    Center(child: Icon( Icons.favorite,size: 15.w)),
    Center(child: Icon( Icons.event_available,size: 15.w)),
  ];

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
      body: SafeArea(child: widgetOptions.elementAt(selectedIndex)),
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
          BottomNavigationBarItem(
              icon:Icon( Icons.event_available,size: 4.w),
            label: 'Event'
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
