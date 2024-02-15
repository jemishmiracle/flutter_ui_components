import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../Constants/ImagePath.dart';

class SimpleList extends StatelessWidget {
  String title;
  SimpleList({super.key,this.title = 'Simple List'});

  List<ListData> listviewData = [
     ListData(title: "Map", img: IconPath.mapIconImg),
     ListData(title: "Album", img: IconPath.albumIconImg21),
     ListData(title: "Phone", img: IconPath.phoneIconImg),
     ListData(title: "DeskTop MAC", img: IconPath.deskTopIconImg),
     ListData(title: "Device Hub", img: IconPath.deviceHubIconImg),
     ListData(title: "Fast Food", img: IconPath.foodIconImg),
     ListData(title: "Flag", img:IconPath.flagIconImg),
     ListData(title: "Folder", img: IconPath.folderIconImg),
     ListData(title: "Games", img:IconPath.gameIconImg),
     ListData(title: "Keyboard", img: IconPath.keyboardIconImg),
     ListData(title: "Group", img: IconPath.groupIconImg),
     ListData(title: "Geadset", img: IconPath.geadsetIconImg),
     ListData(title: "Home", img: IconPath.homeIconImg),
     ListData(title: "Chart", img: IconPath.chartIconImg),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              shrinkWrap: true ,itemCount:listviewData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(listviewData[index].img,fit: BoxFit.cover,height: 5.w,),
                  title:Text( listviewData[index].title),
                );
              },),
        ),
      ),
    );
  }
}

class ListData{
  String title;
  String img;
  ListData({
    required this.title,
    required this.img,
  });
}