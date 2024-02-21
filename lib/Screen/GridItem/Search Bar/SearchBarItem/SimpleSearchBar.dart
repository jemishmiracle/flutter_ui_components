import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class SimpleSearchBar extends StatefulWidget {
   SimpleSearchBar({super.key});

  @override
  State<SimpleSearchBar> createState() => _SimpleSearchBarState();
}

class _SimpleSearchBarState extends State<SimpleSearchBar> {
  TextEditingController controller = TextEditingController();
  bool showList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(ImagePath.searchBgImg2,width: double.infinity,height: 20.h,fit: BoxFit.cover,),
          Padding(padding: EdgeInsets.only(top: 35.w),
            child: Stack(
              children: [
                Image.asset(ImagePath.searchBgImg1,width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                Container(height: 6.h,color: Theme.of(context).secondaryHeaderColor,
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColorDark,style: TextStyle(color: Theme.of(context).primaryColorDark),
                    decoration: InputDecoration(contentPadding: EdgeInsets.only(bottom: 2.h,),
                      hintText: 'Search from below list',border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                      suffixIcon: showList
                          ? IconButton(
                            icon:Icon(Icons.cancel,size: 5.w,color: Theme.of(context).primaryColorDark),
                            onPressed: () {
                              setState(() {controller.clear();showList = false;});},)
                              : null,
                      prefixIcon:Icon(Icons.search_rounded,color: Theme.of(context).primaryColorDark,size: 5.w,),
                    ),
                    onChanged: (value) {
                      setState(() {showList = value.isNotEmpty;});},
                  ),
                ),
                if(showList)...[
                  Expanded(
                    child: Padding(padding: EdgeInsets.only(top: 3.h),
                      child: ListView.builder(
                          itemCount: 100,shrinkWrap: true,
                          itemBuilder: (context, index) => ListTile(title: Text('Event $index',
                            style: TextStyle(color: Theme.of(context).secondaryHeaderColor),),),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
