import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StandardImageList extends StatelessWidget {
   String title;
   StandardImageList({super.key,this.title = 'Standard Image Liat'});

  @override
  Widget build(BuildContext context) {
    List imageData = [
      ImagePath.cityImg1, ImagePath.cityImg2,ImagePath.cityImg3, ImagePath.cityImg4, ImagePath.cityImg5, ImagePath.cityImg6, ImagePath.cityImg7, ImagePath.cityImg8, ImagePath.cityImg9, ImagePath.cityImg10,
      ImagePath.cityImg11, ImagePath.cityImg12, ImagePath.cityImg13, ImagePath.cityImg14, ImagePath.cityImg15, ImagePath.cityImg16, ImagePath.cityImg17, ImagePath.cityImg18, ImagePath.cityImg19, ImagePath.cityImg20,];

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
            Container(
            child: GridView.builder(
              shrinkWrap: true,itemCount: imageData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(2.w),
                  child: ClipRRect(borderRadius: BorderRadius.circular(2.w),
                      child: Image.asset(imageData[index],fit: BoxFit.cover,height: 60.w,width: 60.w,)),
                );
              },
            ),
          ),],
        ),
      ),
    );
  }
}
