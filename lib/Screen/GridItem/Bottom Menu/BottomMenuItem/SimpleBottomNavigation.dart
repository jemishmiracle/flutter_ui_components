import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
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
  List<Color> colorList = <Color>[Color(0xffFF8894), Color(0xff5CC2C6), Color(0xff5EA8E6), Color(0xffFA85B9),];

  static List iconList = <Widget>[
    Center(child: Image.asset(IconPath.bottmMenuIconImg13,fit: BoxFit.cover,height: 10.h,),),
    Center(child: Image.asset(IconPath.bottmMenuIconImg15,fit: BoxFit.cover,height: 10.h,),),
    Center(child: Image.asset(IconPath.bottmMenuIconImg17,fit: BoxFit.cover,height: 10.h,),),
    Center(child: Image.asset(IconPath.bottmMenuIconImg11,fit: BoxFit.cover,height: 10.h,),),
  ];

  void onItemTapped(int index) {setState(() {selectedIndex = index;});}

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
        child: Center(child: iconList.elementAt(selectedIndex),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Image.asset(IconPath.bottmMenuIconImg14,fit: BoxFit.cover,height: 2.h,), label: 'Home'),
          BottomNavigationBarItem(icon:Image.asset(IconPath.bottmMenuIconImg16,fit: BoxFit.cover,height: 2.h,), label: 'People'),
          BottomNavigationBarItem(icon:Image.asset(IconPath.bottmMenuIconImg18,fit: BoxFit.cover,height: 2.h,), label: 'Favorite'),
          BottomNavigationBarItem(icon:Image.asset(IconPath.bottmMenuIconImg12,fit: BoxFit.cover,height: 2.h,), label: 'Event'),
        ],
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        backgroundColor:Colors.indigo,
        showSelectedLabels: true,
        selectedItemColor: Colors.red,
      ),
    );
  }
}
