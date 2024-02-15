import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:sizer/sizer.dart';

class AnimatedSliverAppBar extends StatefulWidget {
   String title;
   AnimatedSliverAppBar({super.key,this.title = 'Flutter is Awesome'});

  @override
  State<AnimatedSliverAppBar> createState() => _AnimatedSliverAppBarState();
}

class _AnimatedSliverAppBarState extends State<AnimatedSliverAppBar> {
  bool status = false;
  @override
  Widget build(BuildContext context) {

    List<AppbarData> lakeImg = [
      AppbarData(title: "Monument Walk Tour",img: ImagePath.travelImg1),
      AppbarData(title:"Lake Walk Tour" , img: ImagePath.travelImg2),
      AppbarData(title:"City Walk Tour" , img: ImagePath.travelImg3),
      AppbarData(title: "Park Walk Tour", img: ImagePath.travelImg4),
      AppbarData(title: "Castle Walk Tour", img: ImagePath.travelImg5),
      AppbarData(title: "Beach Walk Tour", img: ImagePath.travelImg6),
      AppbarData(title:"Vilage Walk Tour" , img: ImagePath.travelImg7),
      AppbarData(title:"River Walk Tour" ,img: ImagePath.travelImg8),
      AppbarData(title:"Mount Walk Tour" , img: ImagePath.travelImg9),
      AppbarData(title: "Garden Walk Tour", img: ImagePath.travelImg10),
    ];
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          [ SliverAppBar(
            expandedHeight: 35.h,
            actions: [
              IconButton(
                onPressed:() {
                  setState(() {
                    status = true;
                  });
                },
                  icon: Icon(Icons.menu),
              )],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
              background: Image.asset(ImagePath.bgimge5,fit: BoxFit.cover,),
            ),
            snap: true,pinned: true,floating: true,
          ),],
          body: Container(
            child: ListView.builder(itemCount: lakeImg.length,shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 17.h,width: double.infinity,
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
                  );
                },
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarData{
  String title;
  String img;

  AppbarData({
    required this.title,
    required this.img,
  });
}
