import 'package:flutter/material.dart';
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
  bool onClick =false; bool searchLists = false;
  String searchText = "";
  String hintTexts = 'Search';
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
    String titleText =
        "                Press the 🔍	icon in the AppBar""\n"
        "and search for an integer between 0 and 100,000.""\n""\n""\n""\n"
        "                     Last selected integer: ${searchText} .";

    return WillPopScope(
      onWillPop: () {if(controller.isSearchBarVisible){controller.toggleSearchBar();return Future.value(false);} else{return Future.value(true);}},
      child: Scaffold(
        appBar: MaterialSearchBar(
          controller: controller,
          appBar: AppBar(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            leading: Icon(Icons.menu,color: Theme.of(context).primaryColorDark,),
            title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
            actions: [IconButton(onPressed: () {controller.toggleSearchBar();setState(() {searchLists = !searchLists;});}, icon: actionIcon),],
          ),
          textField: TextField(
            onChanged: (value) {setState(() {});},
            controller: editingController,
            cursorColor: Theme.of(context).secondaryHeaderColor,
            style: TextStyle(color: Theme.of(context).bottomAppBarColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText:searchText.isEmpty ? hintTexts : searchText, hintStyle: TextStyle(color: Theme.of(context).focusColor)
            ),
          ),
          color: Theme.of(context).primaryColorDark,
          backButton: IconButton(icon: Icon(Icons.arrow_back,color: Theme.of(context).hoverColor,),
            onPressed: () async {
            controller.toggleSearchBar();setState(() {searchLists = false;});},),
          clearButton: IconButton(icon: Icon(Icons.close,color: Theme.of(context).hoverColor,),
            onPressed: () async {
            controller.toggleSearchBar();
            setState(() {searchLists = false;});},),
        ),
        body: SafeArea(child:
         searchLists ? Container(
           child: ListView.builder(
               itemCount: searchList.length,
               itemBuilder: (context, index) =>
                    ListTile(
                      onTap: () {
                        setState(() {searchText = searchList[index].title.toString();});},
                      title: Text(searchList[index].title.toString(),),
                      leading: Icon(searchList[index].icon,color: Theme.of(context).hoverColor,size: 5.w,),
                  )
                )
              )
             :  Container(
                 child: Center(
                   child:Text(titleText,style: TextStyle(color: Theme.of(context).bottomAppBarColor,fontSize: 10.sp,),),),)
        ),
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

}

class searchAppbarData {
  IconData icon;
  int title;

  searchAppbarData({
    required this.icon,
    required this.title,
  });
}
