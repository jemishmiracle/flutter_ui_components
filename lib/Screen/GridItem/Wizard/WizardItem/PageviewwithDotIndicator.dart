import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PageviewwithDotIndicator extends StatefulWidget {
   String title;
   PageviewwithDotIndicator({super.key,this.title = 'PageView with Dot Indicator'});

  @override
  State<PageviewwithDotIndicator> createState() => _PageviewwithDotIndicatorState();
}

class _PageviewwithDotIndicatorState extends State<PageviewwithDotIndicator> {
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
      body: Stack(alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            carouselController: carouselController, // Give the controller
            options: CarouselOptions(
              initialPage: 0,viewportFraction: 1,
              enableInfiniteScroll: false,
              height:double.infinity,
              onPageChanged:(index, reason) {
                setState(() {currentIndex = index;});},
            ),
            items: pageList.map((e) {
              return Image.asset(e,fit: BoxFit.cover,width: double.infinity,);}).toList(),),
          Padding(padding: EdgeInsets.only(bottom: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageList.length, (index) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(radius: currentIndex == index ? 5 : 2,
                  backgroundColor: currentIndex == index ? Theme.of(context).bottomAppBarColor : Theme.of(context).primaryColorDark,),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
