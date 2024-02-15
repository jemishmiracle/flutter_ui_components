import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class SlidableList extends StatelessWidget {
   String title;
   SlidableList({super.key,this.title = 'Slidable List'});
  
  @override
  Widget build(BuildContext context) {
    
    List<SlidableData> senderData = [
      SlidableData(title: "Item 0 Sender", subject: "Subject: 0", img: ImagePath.catImg1),
      SlidableData(title: "Item 1 Sender", subject: "Subject: 1", img: ImagePath.catImg2),
      SlidableData(title: "Item 2 Sender", subject: "Subject: 2", img: ImagePath.catImg3),
      SlidableData(title: "Item 3 Sender", subject: "Subject: 3", img: ImagePath.catImg4),
      SlidableData(title: "Item 4 Sender", subject: "Subject: 4", img: ImagePath.catImg5),
      SlidableData(title: "Item 5 Sender", subject: "Subject: 5", img: ImagePath.catImg6),
      SlidableData(title: "Item 6 Sender", subject: "Subject: 6", img: ImagePath.catImg7),
      SlidableData(title: "Item 7 Sender", subject: "Subject: 7", img: ImagePath.catImg8),
      SlidableData(title: "Item 8 Sender", subject: "Subject: 8", img: ImagePath.catImg9),
      SlidableData(title: "Item 9 Sender", subject: "Subject: 9", img: ImagePath.catImg10),
      SlidableData(title: "Item 10 Sender", subject: "Subject: 10", img: ImagePath.catImg11),
      SlidableData(title: "Item 11 Sender", subject: "Subject: 11", img: ImagePath.catImg12),
      SlidableData(title: "Item 12 Sender", subject: "Subject: 12", img: ImagePath.catImg13),
      SlidableData(title: "Item 13 Sender", subject: "Subject: 13", img: ImagePath.catImg14),
      SlidableData(title: "Item 14 Sender", subject: "Subject: 14", img: ImagePath.catImg15),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Stack(alignment: Alignment.topLeft,
          children: [
            Image.asset(ImagePath.bgimg1,height: double.infinity,fit: BoxFit.cover,width: double.infinity,),
            Container(
              child: ListView.builder(
                shrinkWrap: true ,itemCount:senderData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.asset(
                          senderData[index].img,fit: BoxFit.cover,height: 15.w,width: 15.w,),
                      ),
                    ),
                    title:Text( senderData[index].title,style: TextStyle(color:Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.bold),),
                    subtitle: Text(senderData[index].subject,style: TextStyle(color: Theme.of(context).shadowColor),),
                  );
                },),
            ),
          ],
        )
      ),
    );
  }
}

class SlidableData{
  String title;
  String subject;
  String img;
  
  SlidableData({
    required this.title,
    required this.subject,
    required this.img,
  });
}
