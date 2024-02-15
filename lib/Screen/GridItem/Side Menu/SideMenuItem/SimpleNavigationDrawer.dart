import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class SimpleNavigationDrawer extends StatefulWidget {
  String title;
  SimpleNavigationDrawer({super.key,this.title = 'Navigation Drawer'});

  @override
  State<SimpleNavigationDrawer> createState() => _SimpleNavigationDrawerState();
}

class _SimpleNavigationDrawerState extends State<SimpleNavigationDrawer> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      drawer: Drawer(
        child: ListView(
           children:<Widget> [
             DrawerHeader(
                 decoration: BoxDecoration(
                   color: Theme.of(context).secondaryHeaderColor,
                 ),
                 child:Container(
                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       CircleAvatar(
                           radius: 35,
                           child: ClipOval(
                               child: Image.asset(ImagePath.catImg1,fit: BoxFit.cover,height: 35.w,))),
                       SizedBox(height: 2.w,),
                       Text("Header", style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.w600),),
                       Text("Header detail", style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.w600),),
                     ],
                   ),
                 ),
             ),
             ListTile(
               leading: Icon(Icons.home,color: Theme.of(context).secondaryHeaderColor,),
               title: Text("Home"),
             ),
             Divider(height: 1,),
             ListTile(
               leading: Icon(Icons.favorite,color: Theme.of(context).secondaryHeaderColor,),
               title: Text("Favorites"),
             ),
             Divider(height: 1,),
             ListTile(
               leading: Icon(Icons.music_note,color: Theme.of(context).secondaryHeaderColor,),
               title: Text("Music"),
             ),
             Divider(height: 1,),
             ListTile(
               leading: Icon(Icons.video_camera_front,color: Theme.of(context).secondaryHeaderColor,),
               title: Text("Videos"),
             ),
             Divider(height: 1,),
           ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  image: DecorationImage(
                      image: AssetImage(ImagePath.bgimge8),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
                  )
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(data[index].icon,fit: BoxFit.cover,height: 6.w,),
                  Icon(Icons.home),
                  Text("Home",style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

