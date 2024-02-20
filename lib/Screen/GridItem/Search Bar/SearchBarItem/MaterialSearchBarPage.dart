import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_material_search_bar/flutter_material_search_bar.dart';

class MaterialSearchBarPage extends StatefulWidget {
  String title;
  MaterialSearchBarPage({super.key,this.title = 'Search Gallery'});
  @override
  State<MaterialSearchBarPage> createState() => _MaterialSearchBarPageState();
}

class _MaterialSearchBarPageState extends State<MaterialSearchBarPage> {
  Icon actionIcon = Icon(Icons.search,color: Colors.white,);
  final MaterialSearchBarController controller = MaterialSearchBarController();
  final TextEditingController editingController = TextEditingController();
  bool micShow =false;
  String titleText =
      "                Press the 🔍	icon in the AppBar""\n"
      "and search for an integer between 0 and 100,000.""\n""\n""\n""\n"
      "                     Last selected integer: 0.";

  String micText =
      '           "TODO: implement voice input"'"\n"
      "is not a valid integer between 0 and 100,000.""\n"
      "                               Try again.";

  List<searchAppbarData> searchList = [
    searchAppbarData(icon: Icons.history, title: 10),
    searchAppbarData(icon: Icons.history, title: 55),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {if(controller.isSearchBarVisible){controller.toggleSearchBar();return Future.value(false);} else{return Future.value(true);}},
      child: Scaffold(
        appBar: MaterialSearchBar(
          controller: controller,
          appBar: AppBar(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            leading: Icon(Icons.menu,color: Theme.of(context).primaryColorDark,),
            title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
            actions: [
              IconButton(onPressed: () => controller.toggleSearchBar(), icon: actionIcon),
            ],
          ),
          textField: TextField(
            onChanged: (value) {
              setState(() {
                if(searchList.isNotEmpty){
                  List.generate(searchList.length, (index) =>
                      ListTile(leading: Icon(searchList[index].icon,color: Theme.of(context).hoverColor,),
                        title: Text(searchList[index].title.toString()),));
                }
                else{
                  searchList.clear();
                }
              });

            },
            controller: editingController,
            cursorColor: Theme.of(context).secondaryHeaderColor,
            style: TextStyle(color: Theme.of(context).bottomAppBarColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search',hintStyle: TextStyle(color: Theme.of(context).focusColor)
            ),
          ),
          color: Theme.of(context).primaryColorDark,
          backButton: IconButton(
             icon: Icon(Icons.arrow_back,color: Theme.of(context).hoverColor,),
             onPressed: () async {editingController.text = '';controller.toggleSearchBar();},
          ),
          clearButton: IconButton(
            icon: Icon(micShow ? Icons.close:Icons.mic,color: Theme.of(context).hoverColor,),
            onPressed: () {
              editingController.text = 'TODO: implement voice input';
              searchList.clear();
              setState(() {micShow = !micShow;});
            },),
        ),
        body: SafeArea(child: searchData(context: context,text: micShow ?  micText : titleText,
            textColor: micShow ? Theme.of(context).bottomAppBarColor : Theme.of(context).secondaryHeaderColor),),
      ),
    );
  }

  Widget searchData({
    required BuildContext context,
    required String text,Color? textColor}){
    return Container(
      child: Center(
        child:Text(text,style: TextStyle(color: textColor,fontSize: 10.sp),),
      ),
    );
  }

  Widget valueShow({
    required BuildContext context,int? number}){
    return Padding(padding: EdgeInsets.all(1.w),
      child: Column(
        children: [
          Container(
            height: 10.h,width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,borderRadius: BorderRadius.circular(1.w),
                boxShadow: [BoxShadow(color: Theme.of(context).hoverColor,blurRadius: 3.0,blurStyle: BlurStyle.outer)]
            ),
            child: Column(
              children: [
                Text("This integer",style: TextStyle(fontWeight: FontWeight.normal),),
                SizedBox(height: 2.h,), Text(number.toString(),style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          Container(
            height: 10.h,width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,borderRadius: BorderRadius.circular(1.w),
                boxShadow: [BoxShadow(color: Theme.of(context).hoverColor,blurRadius: 3.0,blurStyle: BlurStyle.outer)]
            ),
            child: Column(
              children: [
                Text("Next integer",style: TextStyle(fontWeight: FontWeight.normal),),
                SizedBox(height: 2.h,), Text(number.toString(),style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          Container(
            height: 10.h,width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,borderRadius: BorderRadius.circular(1.w),
                boxShadow: [BoxShadow(color: Theme.of(context).hoverColor,blurRadius: 3.0,blurStyle: BlurStyle.outer)]
            ),
            child: Column(
              children: [
                Text("Previous integer",style: TextStyle(fontWeight: FontWeight.normal),),
                SizedBox(height: 2.h,), Text(number.toString(),style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class searchAppbarData {
  IconData icon;
  int title;

  searchAppbarData({
    required this.icon,
    required this.title,
  });
}