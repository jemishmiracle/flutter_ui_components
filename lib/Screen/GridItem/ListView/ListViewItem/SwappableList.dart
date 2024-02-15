import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SwappableList extends StatefulWidget {
  String title;
  SwappableList({super.key,this.title = 'Swipeable List'});
  @override
  State<SwappableList> createState() => _SwappableListState();
}

class _SwappableListState extends State<SwappableList> {
  @override
  Widget build(BuildContext context) {

    List<SwipeData> itemData = [
      SwipeData(title: "Item 0 Sender", subject: "Subject: 0", img: ImagePath.catImg16),
      SwipeData(title: "Item 1 Sender", subject: "Subject: 1", img: ImagePath.catImg17),
      SwipeData(title: "Item 2 Sender", subject: "Subject: 2", img: ImagePath.catImg18),
      SwipeData(title: "Item 3 Sender", subject: "Subject: 3", img: ImagePath.catImg19),
      SwipeData(title: "Item 4 Sender", subject: "Subject: 4", img: ImagePath.catImg20),
      SwipeData(title: "Item 5 Sender", subject: "Subject: 5", img: ImagePath.catImg21),
      SwipeData(title: "Item 6 Sender", subject: "Subject: 6", img: ImagePath.catImg22),
      SwipeData(title: "Item 7 Sender", subject: "Subject: 7", img: ImagePath.catImg23),
      SwipeData(title: "Item 8 Sender", subject: "Subject: 8", img: ImagePath.catImg24),
      SwipeData(title: "Item 9 Sender", subject: "Subject: 9", img: ImagePath.catImg25),
      SwipeData(title: "Item 10 Sender", subject: "Subject: 10", img: ImagePath.catImg26),
      SwipeData(title: "Item 11 Sender", subject: "Subject: 11", img: ImagePath.catImg27),
      SwipeData(title: "Item 12 Sender", subject: "Subject: 12", img: ImagePath.catImg28),
      SwipeData(title: "Item 13 Sender", subject: "Subject: 13", img: ImagePath.catImg29),
      SwipeData(title: "Item 14 Sender", subject: "Subject: 14", img: ImagePath.catImg30),
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
        child: Container(
          child: ListView.builder(
              itemCount: itemData.length,
              itemBuilder: (context, index) {
                // return Padding(
                //   padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 5.w),
                //   child: Container(
                //     height: 23.h,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.horizontal(right: Radius.circular(1.w)),
                //         color: Theme.of(context).shadowColor,
                //     ),
                //     child: Row(
                //       children: [
                //         Image.asset(itemData[index].img,fit: BoxFit.cover,height: 23.h,width: 40.w,),SizedBox(width: 4.w,),
                //         Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(itemData[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                //             Text(itemData[index].subject)
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // );
                return Dismissible(
                    key:UniqueKey(),
                    background: Container(
                      height: 23.h,color: Theme.of(context).dividerColor,
                      child: Center(
                          child: Icon(Icons.delete)),
                    ),
                    onDismissed: (direction) {
                      SwipeData name = itemData[index];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("You deleted ${name.title}"),
                         action: SnackBarAction(
                           onPressed: () {
                             print("names[index] ${itemData[index].title}");
                             itemData.insert(index, name);
                             setState(() {});
                           },
                           label: "Undo",
                         ),
                      ));
                      itemData.removeAt(index);
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.w,right: 2.w,top: 5.w),
                      child: Container(
                        height: 23.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(1.w)),
                            color: Theme.of(context).shadowColor,
                        ),
                        child: Row(
                          children: [
                            Image.asset(itemData[index].img,fit: BoxFit.cover,height: 23.h,width: 40.w,),SizedBox(width: 4.w,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(itemData[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(itemData[index].subject)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),);
              },
          ),
        ),
      ),
    );
  }
}

class SwipeData{
  String title;
  String subject;
  String img;

  SwipeData({
    required this.title,
    required this.subject,
    required this.img,
  });
}