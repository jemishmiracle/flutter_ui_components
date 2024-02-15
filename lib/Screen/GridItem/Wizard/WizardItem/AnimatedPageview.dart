import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnimatedPageview extends StatelessWidget {
  String title;
  AnimatedPageview({super.key,this.title = 'Animated Pageview'});
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
      body: Padding(
        padding:  EdgeInsets.all(2.w),
        child: CarouselSlider(
          carouselController: carouselController,
          items: pageList.map((e) =>  Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: Container(
              width: 70.w,
              child: ClipRRect(borderRadius: BorderRadius.circular(2.w),
                child: Image.asset(e,fit: BoxFit.cover,),
              ),
            ),
          ),).toList(),
          options:  CarouselOptions(
            height: double.infinity,enableInfiniteScroll: true,
            pageSnapping: true, viewportFraction: 0.7,initialPage: 0,
          ),
        ),
      ),
    );
  }
}
