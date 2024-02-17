import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class TitledBottomBar extends StatefulWidget {
  String title;
  TitledBottomBar({super.key,this.title = 'Titled Bottom Bar'});

  @override
  State<TitledBottomBar> createState() => _TitledBottomBarState();
}

class _TitledBottomBarState extends State<TitledBottomBar> {

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
        bottomNavigationBar: TitledBottomNavigationBar(
            currentIndex: 2,
            onTap: (index){},
            items: [
              TitledNavigationBarItem(title: Text('Home',style: TextStyle(color: Theme.of(context).indicatorColor),), icon: Icon(Icons.home,color: Theme.of(context).indicatorColor,)),
              TitledNavigationBarItem(title: Text('Search',style: TextStyle(color: Theme.of(context).indicatorColor),), icon: Icon(Icons.search,color: Theme.of(context).indicatorColor,)),
              TitledNavigationBarItem(title: Text('Bag',style: TextStyle(color: Theme.of(context).indicatorColor),), icon: Icon(Icons.card_travel,color: Theme.of(context).indicatorColor,)),
              TitledNavigationBarItem(title: Text('Orders',style: TextStyle(color: Theme.of(context).indicatorColor),), icon: Icon(Icons.shopping_cart,color: Theme.of(context).indicatorColor,)),
              TitledNavigationBarItem(title: Text('Profile',style: TextStyle(color: Theme.of(context).indicatorColor),), icon: Icon(Icons.person_outline,color: Theme.of(context).indicatorColor,)),
            ]
        )
    );
  }
}
