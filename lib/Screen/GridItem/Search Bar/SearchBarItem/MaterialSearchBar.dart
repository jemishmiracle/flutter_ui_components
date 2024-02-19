import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MaterialSearchBar extends StatefulWidget {
  String title;
  MaterialSearchBar({super.key,this.title = 'Search Gallery'});
  @override
  State<MaterialSearchBar> createState() => _MaterialSearchBarState();
}

class _MaterialSearchBarState extends State<MaterialSearchBar> {
  Icon actionIcon = Icon(Icons.search,color: Colors.white,);

  String titleText =
      "                Press the 🔍	icon in the AppBar""\n"
      "and search for an integer between 0 and 100,000.""\n""\n""\n""\n"
      "                     Last selected integer: 0.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        leading: Icon(Icons.menu,color: Theme.of(context).primaryColorDark,),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        actions: <Widget>[
          IconButton(
              onPressed: () {setState(() => textField());},
              icon: actionIcon),
        ],
      ),
      body: SafeArea(
        child: searchData(context: context, text: titleText),
      ),
    );
  }

  Widget searchData({
    required BuildContext context,
    required String text,}){
    return Container(
      child: Center(
        child:Text(text,style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontSize: 10.sp),),
      ),
    );
  }

  Widget textField(){
    return TextField(
      decoration: InputDecoration(
        prefixIcon: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Get.back()),
        hintText: 'Search',hintStyle: TextStyle(color: Theme.of(context).hoverColor),
        suffixIcon: IconButton(icon: Icon(Icons.mic),onPressed: () => Get.back(),)
      ),
    );
  }


}
