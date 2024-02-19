import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class ToolbarSearchBar extends StatefulWidget {
  ToolbarSearchBar({super.key,});

  @override
  State<ToolbarSearchBar> createState() => _ToolbarSearchBarState();
}

class _ToolbarSearchBarState extends State<ToolbarSearchBar> {
  Widget appBarTitle = Text('Search Sample',style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w500),);
  Icon actionIcon = Icon(Icons.search,color: Colors.white,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        leading: Icon(Icons.menu,color: Theme.of(context).primaryColorDark,),
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                setState(() {
                  if(this.actionIcon.icon == Icons.search){
                    this.actionIcon = Icon(Icons.close,color: Theme.of(context).primaryColorDark,);
                    this.appBarTitle = TextField(style: TextStyle(color: Theme.of(context).primaryColorDark),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,color: Theme.of(context).primaryColorDark,),
                      hintText: 'Search...',hintStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                    ),
                    );
                  }
                  else{
                    this.appBarTitle = Text('Search Sample',
                      style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 18.sp,fontWeight: FontWeight.w500),);
                    this.actionIcon = Icon(Icons.search,color: Theme.of(context).primaryColorDark,);
                  }
                });
              },icon: actionIcon)
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
          ],
        ),),
    );
  }
}
