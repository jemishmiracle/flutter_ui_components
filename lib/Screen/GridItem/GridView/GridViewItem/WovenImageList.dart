import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WovenImageList extends StatelessWidget {
   String title;
   WovenImageList({super.key,this.title = 'Woven Image List'});


  @override
  Widget build(BuildContext context) {
    List imageData = [
      ImagePath.homeImg1, ImagePath.homeImg11,ImagePath.homeImg2, ImagePath.homeImg12, ImagePath.homeImg3, ImagePath.homeImg13, ImagePath.homeImg4, ImagePath.homeImg14, ImagePath.homeImg5, ImagePath.homeImg15,
      ImagePath.homeImg6, ImagePath.homeImg16, ImagePath.homeImg7, ImagePath.homeImg17, ImagePath.homeImg8, ImagePath.homeImg18, ImagePath.homeImg9, ImagePath.homeImg19, ImagePath.homeImg10, ImagePath.homeImg20,];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child:Stack(
          children:[
            Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
            GridView.builder(
              shrinkWrap: true,itemCount: imageData.length,padding: EdgeInsets.all(5.w),
              gridDelegate: SliverWovenGridDelegate.count(
                  pattern: [
                        WovenGridTile(1),
                        WovenGridTile(
                          5 / 7,
                          crossAxisRatio: 0.9,
                          alignment: AlignmentDirectional.centerEnd,
                        ),
                      ],
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.w,
                    crossAxisSpacing: 10.w,
              ),
              itemBuilder: (context, index) {
                return Container(
                  child:Image.asset(imageData[index],fit: BoxFit.cover,) ,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}