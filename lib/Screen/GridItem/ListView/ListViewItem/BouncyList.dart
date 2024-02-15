import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BouncyList extends StatelessWidget {
   String title;
   BouncyList({super.key,this.title = 'Bouncy List'});

  @override
  Widget build(BuildContext context) {
    List<BouncyData> lakeImg = [
      BouncyData(title: "Monument Walk Tour",img: ImagePath.travelImg1),
      BouncyData(title:"Lake Walk Tour" , img: ImagePath.travelImg2),
      BouncyData(title:"City Walk Tour" , img: ImagePath.travelImg3),
      BouncyData(title: "Park Walk Tour", img: ImagePath.travelImg4),
      BouncyData(title: "Castle Walk Tour", img: ImagePath.travelImg5),
      BouncyData(title: "Beach Walk Tour", img: ImagePath.travelImg6),
      BouncyData(title:"Vilage Walk Tour" , img: ImagePath.travelImg7),
      BouncyData(title:"River Walk Tour" ,img: ImagePath.travelImg8),
      BouncyData(title:"Mount Walk Tour" , img: ImagePath.travelImg9),
      BouncyData(title: "Garden Walk Tour", img: ImagePath.travelImg10),
     ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: lakeImg.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.w),
                    child: Container(height: 17.h,width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(lakeImg[index].img),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Theme.of(context).bottomAppBarColor.withOpacity(0.6), BlendMode.darken)
                          )
                      ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(lakeImg[index].title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 15.sp),),
                          Text("3.30 mins walking tour",style: TextStyle(fontSize: 7.sp,color: Theme.of(context).primaryColorDark),),
                        ],
                      ),
                    ),
                  ),
                );
              },),
        ),
      ),
    );
  }
}

class BouncyData{
  String title;
  String img;

  BouncyData({
    required this.title,
    required this.img,
  });
}