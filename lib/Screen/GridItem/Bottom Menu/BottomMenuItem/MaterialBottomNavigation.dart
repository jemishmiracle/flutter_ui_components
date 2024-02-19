import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MaterialBottomNavigation extends StatefulWidget {
   String title;
   MaterialBottomNavigation({super.key,this.title = 'Material Bottom Bar'});

  @override
  State<MaterialBottomNavigation> createState() => _MaterialBottomNavigationState();
}

class _MaterialBottomNavigationState extends State<MaterialBottomNavigation> {
  int currentIndex =  0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {

    List<Widget> pageList = [
      Center(child: Text("Home",style: TextStyle(color: Color(0xff008BFF),fontSize: 30.sp,fontWeight: FontWeight.normal),),),
      Center(child: Text("Favorites",style: TextStyle(color:  Color(0xffFF0000),fontSize: 30.sp,fontWeight: FontWeight.normal),),),
      Center(child: Text("Videos",style: TextStyle(color: Color(0xff35011F),fontSize: 30.sp,fontWeight: FontWeight.normal),),),
      Center(child: Text("Settings",style: TextStyle(color: Color(0xffFF0071),fontSize: 30.sp,fontWeight: FontWeight.normal),),),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: PageView(
            controller: pageController,
            onPageChanged: (value) =>  setState(() => currentIndex = value),
            children: List.generate(pageList.length, (index) => pageList.elementAt(currentIndex)),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home',style: TextStyle(color: Color(0xff008BFF)),),
              icon: Image.asset(IconPath.bottmMenuIconImg8,fit: BoxFit.cover,height: 5.w,),
              activeColor: Color(0xff008BFF),
          ),
          BottomNavyBarItem(
              title: Text('Favorites',style: TextStyle(color:  Color(0xffFF0000)),),
              icon: Image.asset(IconPath.bottmMenuIconImg10,fit: BoxFit.cover,height: 5.w,),
              activeColor: Color(0xffFF0000),
          ),
          BottomNavyBarItem(
              title: Text('Videos',style: TextStyle(color: Color(0xff35011F)),),
              icon: Image.asset(IconPath.bottmMenuIconImg9,fit: BoxFit.cover,height: 5.w,),
              activeColor: Color(0xff35011F),
          ),
          BottomNavyBarItem(
              title: Text('Settings',style: TextStyle(color: Color(0xffFF0071)),),
              icon: Image.asset(IconPath.bottmMenuIconImg7,fit: BoxFit.cover,height: 5.w,),
              activeColor: Color(0xffFF0071),
          ),
        ],
        selectedIndex: currentIndex,
        onItemSelected: (int value) {
          setState(() => currentIndex = value);
          pageController.animateToPage(value, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}
