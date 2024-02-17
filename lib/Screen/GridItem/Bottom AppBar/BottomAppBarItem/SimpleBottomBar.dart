import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SimpleBottomBar extends StatelessWidget {
  String title;
  SimpleBottomBar({super.key,this.title = 'Bottom App Bar'});

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
      body: Container(),
      bottomNavigationBar: Stack(alignment: Alignment.bottomRight,
        children: [
          Container(height: 6.h,width: double.infinity,
              child: Column(
                children: [
                  Divider(height: 1.w,color: Theme.of(context).splashColor,),
                  Padding(padding:EdgeInsets.only(top: 3.w,left: 2.w),
                    child: Row(
                      children: [
                        Image.asset(IconPath.bottomappbarIconImg5,fit: BoxFit.cover,height: 5.w,),SizedBox(width: 5.w,),
                        Image.asset(IconPath.bottomappbarIconImg7,fit: BoxFit.cover,height: 5.w,),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(padding: EdgeInsets.only(bottom: 5.w,right: 4.w),
            child: Container(height: 6.h,width: 38.w,
              child: ElevatedButton(onPressed: (){}, child: Row(
                children: [
                  Icon(Icons.add,color: Theme.of(context).primaryColorDark,size: 5.w,),
                  Text('Add a task',style: TextStyle(color: Theme.of(context).primaryColorDark),),
                ],
              ),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).indicatorColor),),
              ),
            ),
          )
        ],)
    );
  }
}
