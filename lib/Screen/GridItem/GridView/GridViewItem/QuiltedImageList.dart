import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class QuiltedImageList extends StatelessWidget {
   String title;
   QuiltedImageList({super.key,this.title = 'Quilted Image List'});

  @override
  Widget build(BuildContext context) {

    List imageData = [
      ImagePath.cafeImg1, ImagePath.cafeImg6,ImagePath.cafeImg7, ImagePath.cafeImg16, ImagePath.cafeImg2, ImagePath.cafeImg8, ImagePath.cafeImg9, ImagePath.cafeImg17, ImagePath.cafeImg3, ImagePath.cafeImg10,
      ImagePath.cafeImg11, ImagePath.cafeImg18, ImagePath.cafeImg4, ImagePath.cafeImg12, ImagePath.cafeImg13, ImagePath.cafeImg19, ImagePath.cafeImg5, ImagePath.cafeImg14, ImagePath.cafeImg15, ImagePath.cafeImg20,];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
            Container(
              child: GridView.custom(
                padding: EdgeInsets.all(1.w),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  repeatPattern: QuiltedGridRepeatPattern.same,
                  pattern: [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 2),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => 
                            Card(
                              color: Theme.of(context).primaryColorDark,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.w)),
                              child: Padding(
                                padding: EdgeInsets.all(1.w),
                                child: ClipRRect(borderRadius: BorderRadius.circular(2.w),
                                    child: Image.asset(imageData[index],fit: BoxFit.cover,)),
                              ),
                            ),
                    childCount: imageData.length),
              ),
            ),
          ],
        )
      ),
    );
  }
}


