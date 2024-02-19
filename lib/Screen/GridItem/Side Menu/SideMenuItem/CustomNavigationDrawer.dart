import 'package:flutter/material.dart';
import 'package:flutter_hidden_drawer/flutter_hidden_drawer.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomNavigationDrawer extends StatefulWidget {
  String title;
  CustomNavigationDrawer({super.key,this.title = 'THE NAVIGATION DEMO'});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    List<NavigationData> navigationList = [
      NavigationData(img: ImagePath.foodImg1,icon:IconPath.sideMenuIconImg7,title:"il domacca", text: '78 5TH AVENUE, YORK',conColor: Color(0xffFF9700)),
      NavigationData(img: ImagePath.foodImg2,icon:IconPath.sideMenuIconImg8,title:"Mc Grady", text: '79 5TH AVENUE, YORK',conColor: Theme.of(context).dividerColor),
      NavigationData(img: ImagePath.foodImg3,icon:IconPath.sideMenuIconImg9,title:"Sugar & Spice", text: '80 5TH AVENUE, YORK',conColor: Theme.of(context).dialogBackgroundColor),
      NavigationData(img: ImagePath.foodImg4,icon:IconPath.sideMenuIconImg10,title:"South Indian", text: '81 5TH AVENUE, YORK',conColor: Theme.of(context).indicatorColor),
    ];

    List<MenuData> menuList = [
      MenuData(title:"THE PADDOCK", status: false),
      MenuData(title:"HE HERO", status: false),
      MenuData(title:"THELP US GROW", status: false),
      MenuData(title:"SETTINGS", status: false),
    ];
    // return HiddenDrawer(
    //  drawerWidth:  MediaQuery.of(context).size.width * .4,
    //   drawer: HiddenDrawerMenu(
    //     menu: [
    //       DrawerMenu(child: Text("THE PADDOCK"), onPressed: (){}),
    //       DrawerMenu(child: Text("THE PADDOCK"), onPressed: (){}),
    //       DrawerMenu(child: Text("THE PADDOCK"), onPressed: (){}),
    //       DrawerMenu(child: Text("THE PADDOCK"), onPressed: (){}),
    //     ],
    //   ),
    //    child: Scaffold(
    //         appBar:AppBar(
    //           title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600,),),
    //           iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
    //           backgroundColor: Theme.of(context).secondaryHeaderColor,
    //         ),
    //          backgroundColor: Theme.of(context).splashColor,
    //          body: SafeArea(
    //            child: Container(
    //              child: ListView.builder(
    //                shrinkWrap: true,padding: EdgeInsets.only(left: 2.w,top: 2.w,right: 2.w),
    //                itemCount: navigationList.length,
    //                itemBuilder: (context, index) {
    //                  return Navigation(
    //                    context: context,img: navigationList[index].img,iconImg: navigationList[index].icon,title: navigationList[index].title,
    //                    subtitle: navigationList[index].text,icon: Icons.favorite_border,likeNum: "84",conColor: navigationList[index].conColor,
    //                  );
    //                },),
    //            ),
    //          ),
    //    ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DrawerMenuState(),)
      ],
      child: HiddenDrawer(
        drawerWidth: MediaQuery.of(context).size.width * .4,
        drawer: HiddenDrawerMenu(
          menu: <DrawerMenu>[
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Menu 1"),
                ),
                onPressed: () {
                  print("Menu 1");
                }),
            DrawerMenu(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Menu 2"),
                ),
                onPressed: () {
                  print("Menu 2");
                }),
          ],
          header: Text("Header"),
          footer: Text("Footer"),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: HiddenDrawerIcon(
              mainIcon: Icon(Icons.art_track),
            ),
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'First Screen',
                ),
                ElevatedButton(
                  child: Text("Go to next screen"),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Navigation({
    required BuildContext context,IconData? icon,
    String? img,Color? conColor,String? iconImg,
    String? title,String? subtitle,String? likeNum,}){
    return Padding(padding:EdgeInsets.only(bottom: 3.w),
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(1.w),bottomRight: Radius.circular(1.w)),),
        child: Column(
          children: [
            Image.asset(img ?? "",fit: BoxFit.cover,height: 20.h,width: double.infinity,),
            ListTile(
              leading: Container(height: 6.h,width: 11.w,
                decoration: BoxDecoration(color: conColor, borderRadius: BorderRadius.circular(3.w),),
                child: Center(child: Image.asset(iconImg ?? "",fit: BoxFit.cover,height: 5.w,)),
              ),
              title: Text(title ?? "",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
              subtitle: Text(subtitle ?? "",style: TextStyle(fontSize: 13.sp,color: Theme.of(context).cardColor),),
              trailing: Padding(padding: EdgeInsets.only(top: 2.w),
                child: Column(
                  children: [
                    Icon(icon,size: 6.w,color: Theme.of(context).dividerColor,),
                    Text(likeNum ?? "",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10.sp),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationData{
  String img;
  String icon;
  String title;
  String text;
  Color conColor;

  NavigationData({
    required this.img,
    required this.icon,
    required this.title,
    required this.text,
    required this.conColor,
  });
}

class MenuData  {
  String title;
  bool status;

  MenuData({
    required this.title,
    required this.status,
  });
}