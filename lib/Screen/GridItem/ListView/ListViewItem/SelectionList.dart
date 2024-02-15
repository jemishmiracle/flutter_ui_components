import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SelectionList extends StatefulWidget {
   String title;
   SelectionList({super.key,this.title = 'Selection List'});

  @override
  State<SelectionList> createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {

  List<SelectData> selectList = [
    SelectData(img: ImagePath.catImg31, title: "Item 1", subject: "This is description of Item 1",status: false),
    SelectData(img: ImagePath.catImg32, title: "Item 2", subject: "This is description of Item 2",status: false),
    SelectData(img: ImagePath.catImg33, title: "Item 3", subject: "This is description of Item 3",status: false),
    SelectData(img: ImagePath.catImg34, title: "Item 4", subject: "This is description of Item 4",status: false),
    SelectData(img: ImagePath.catImg35, title: "Item 5", subject: "This is description of Item 5",status: false),
    SelectData(img: ImagePath.catImg36, title: "Item 6", subject: "This is description of Item 6",status: false),
    SelectData(img: ImagePath.catImg37, title: "Item 7", subject: "This is description of Item 7",status: false),
    SelectData(img: ImagePath.catImg38, title: "Item 8", subject: "This is description of Item 8",status: false),
    SelectData(img: ImagePath.catImg39, title: "Item 9", subject: "This is description of Item 9",status: false),
    SelectData(img: ImagePath.catImg40, title: "Item 10", subject: "This is description of Item 10",status: false),
    SelectData(img: ImagePath.catImg41, title: "Item 11", subject: "This is description of Item 11",status: false),
    SelectData(img: ImagePath.catImg42, title: "Item 12", subject: "This is description of Item 12",status: false),
    SelectData(img: ImagePath.catImg43, title: "Item 13", subject: "This is description of Item 13",status: false),
    SelectData(img: ImagePath.catImg44, title: "Item 14", subject: "This is description of Item 14",status: false),
    SelectData(img: ImagePath.catImg45, title: "Item 15", subject: "This is description of Item 15",status: false),
  ];
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
        child: Container(padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.w),
          child: ListView.builder(
            itemCount: selectList.length,shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 1.w),
                  child: Container(
                     decoration: BoxDecoration(
                        color:Theme.of(context).primaryColorDark,
                        boxShadow: [BoxShadow(color: Theme.of(context).shadowColor,blurRadius: 3.0,blurStyle: BlurStyle.outer)],
                        borderRadius: BorderRadius.circular(1.w)),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: Image.asset(
                            selectList[index].img,fit: BoxFit.cover,height: 15.w,width: 15.w,),
                        ),
                      ),
                      title:Text(selectList[index].title,style: TextStyle(color:Theme.of(context).secondaryHeaderColor,),),
                      subtitle: Text(selectList[index].subject,style: TextStyle(color: Theme.of(context).shadowColor),),
                      trailing: Checkbox(
                        value: selectList[index].status,side: BorderSide(color: Theme.of(context).cardColor,width: 2),visualDensity: VisualDensity.compact,
                        activeColor: Theme.of(context).secondaryHeaderColor,
                        onChanged: (value) {
                          selectList[index].status = value!;
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                );
              },
          ),
        ),
      ),
    );
  }
}

class SelectData{
  String img;
  String title;
  String subject;
  bool status;

  SelectData({
    required this.img,
    required this.title,
    required this.subject,
    required this.status,
  });

}