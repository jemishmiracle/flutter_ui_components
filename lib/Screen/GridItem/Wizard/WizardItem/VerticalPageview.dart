import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class VerticalPageview extends StatelessWidget {
   String title;
   VerticalPageview({super.key,this.title = 'Vertical Pageview'});
  CarouselController carouselController = CarouselController();
  List pageList = [ImagePath.pageViewImg1, ImagePath.pageViewImg2, ImagePath.pageViewImg3, ImagePath.pageViewImg4, ImagePath.pageViewImg5, ImagePath.pageViewImg6,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Container(
        child: CarouselSlider(
          carouselController: carouselController,
          items: pageList.map((e) =>  Padding(
            padding: EdgeInsets.only(right: 1.w,left: 1.w,bottom: 3.w,top: 3.w),
            child: Container(
              width: double.infinity,
              child: ClipRRect(borderRadius: BorderRadius.circular(2.w),
                child: Image.asset(e,fit: BoxFit.cover,),
              ),
            ),
          ),).toList(),
          options:  CarouselOptions(viewportFraction: 0.8,
            height:double.infinity,enableInfiniteScroll: false,
            pageSnapping: true, scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
