import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class SimpleSearchBar extends StatelessWidget {
   SimpleSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(ImagePath.searchBgImg2,width: double.infinity,height: 20.h,fit: BoxFit.cover,),
          Padding(
              padding: EdgeInsets.only(top: 35.w),
              child: Container(height: 4.h,
                child: ListTile(
                  title: TextField(
                    decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 2.w),
                      hintText: 'Search from below list',border: InputBorder.none,
                      hintStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                  leading: Icon(Icons.search_rounded,color: Theme.of(context).primaryColorDark,size: 5.w,),
                  style: ListTileStyle.list,tileColor: Theme.of(context).secondaryHeaderColor,
                ),
              ),
          ),
          Padding(padding:EdgeInsets.only(top: 45.w),
            child: Image.asset(ImagePath.searchBgImg1,fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
          ),
        ],
      ),
    );
  }
}
