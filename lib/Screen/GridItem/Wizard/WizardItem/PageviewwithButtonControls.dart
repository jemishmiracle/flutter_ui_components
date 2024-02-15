import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PageviewwithButtonControls extends StatefulWidget {
   String title;
   PageviewwithButtonControls({super.key,this.title = 'PageView with Button Controls'});

  @override
  State<PageviewwithButtonControls> createState() => _PageviewwithButtonControlsState();
}

class _PageviewwithButtonControlsState extends State<PageviewwithButtonControls> {
  // PageController pageController = PageController();
  CarouselController carouselController = CarouselController();
  List pageList = [ImagePath.pageViewImg1, ImagePath.pageViewImg2, ImagePath.pageViewImg3, ImagePath.pageViewImg4, ImagePath.pageViewImg5, ImagePath.pageViewImg6,];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Center(
        child: Stack(alignment: Alignment.center,
          children: [
            CarouselSlider(
                carouselController: carouselController,
                items: pageList.map((e) =>
                  Image.asset(e,fit: BoxFit.cover,width: double.infinity,)).toList(),
                options: CarouselOptions(
                  height: 55.h,
                  enableInfiniteScroll: true,
                  pageSnapping: true,
                  initialPage: 0,
                  viewportFraction: 1
                )
            ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               IconButton(
                 onPressed: () {
                   carouselController.previousPage();
                 },
                 icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColorDark,),
               ),
               IconButton(
                 onPressed: () {
                   carouselController.nextPage();
                 },
                 icon: Icon(Icons.arrow_forward_ios,color: Theme.of(context).primaryColorDark,),
               ),
             ],
           )
          ],
        ),
      ),
    );
  }
}
