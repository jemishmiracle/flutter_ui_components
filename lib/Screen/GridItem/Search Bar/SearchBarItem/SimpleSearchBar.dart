import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class SimpleSearchBar extends StatelessWidget {
   SimpleSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   children: [
      //     Image.asset(ImagePath.searchBgImg2,width: double.infinity,height: 20.h,),
      //     Padding(
      //         padding: EdgeInsets.only(top: 20.w),
      //         child: ListTile(
      //           title: TextField(
      //             decoration: InputDecoration(
      //               hintText: 'Serach from below list',border: InputBorder.none,
      //             ),
      //           ),
      //           leading: Icon(Icons.search_rounded,color: Theme.of(context).primaryColorDark,size: 5.w,),
      //           style: ListTileStyle.list,tileColor: Theme.of(context).secondaryHeaderColor,
      //         ),
      //     ),
      //   ],
      // ),
    );
  }
}
