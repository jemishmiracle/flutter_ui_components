import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/IconPath.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:flutter_ui_components/Route/Routes.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<gridViewData> data = [
      gridViewData(img: ImagePath.bgimge1, title: 'ListView', icon: IconPath.listIconImg),
      gridViewData(img: ImagePath.bgimge2, title: 'GridView', icon: IconPath.gridIconImg),
      gridViewData(img: ImagePath.bgimge3, title: 'SliverAppbar', icon: IconPath.appbarIconImg),
      gridViewData(img: ImagePath.bgimge4, title: 'Side Menu', icon: IconPath.sideMenuIconImg),
      gridViewData(img: ImagePath.bgimge5, title: 'Bottom Menu', icon: IconPath.bottomIconImg),
      gridViewData(img: ImagePath.bgimge6, title: 'Tabs', icon: IconPath.tabIconImg),
      gridViewData(img: ImagePath.bgimge7, title: 'Wizard', icon: IconPath.wizarIconImg),
      gridViewData(img: ImagePath.bgimge8, title: 'SplashScreen', icon: IconPath.splashscreenIconImg),
      gridViewData(img: ImagePath.bgimge9, title: 'Progress Bars', icon: IconPath.procesBarIconImg),
      gridViewData(img: ImagePath.bgimge10, title: 'Text', icon: IconPath.textIconImg),
      gridViewData(img: ImagePath.bgimge11, title: 'Text Fields', icon: IconPath.textFiledIconImg),
      gridViewData(img: ImagePath.bgimge12, title: 'Buttons', icon: IconPath.buttonIconImg),
      gridViewData(img: ImagePath.bgimge13, title: 'Chips Gallery', icon: IconPath.galleryIconImg),
      gridViewData(img: ImagePath.bgimge14, title: 'Bottom AppBar', icon: IconPath.bottomAppbarIconImg),
      gridViewData(img: ImagePath.bgimge15, title: 'Dialogs', icon: IconPath.dialogsIconImg),
      gridViewData(img: ImagePath.bgimge16, title: 'Social Login', icon: IconPath.socialLoginIconImg),
      gridViewData(img: ImagePath.bgimge17, title: 'Profile', icon: IconPath.profileIconImg),
      gridViewData(img: ImagePath.bgimge18, title: 'SearchBar', icon: IconPath.searchIconImg),
      gridViewData(img: ImagePath.bgimge19, title: 'GoogleMap', icon: IconPath.googleMapsIconImg),
      gridViewData(img: ImagePath.bgimge20, title: 'Firebase Admob', icon: IconPath.firebaseIconImg),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(
          child: GridView.builder(
              shrinkWrap: true,itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(2.w),
                  child: InkWell(
                    onTap:() {
                      switch(index){
                        case 0:
                          Get.toNamed(Routes.listviewScreen);
                          break;
                        case 1:
                          Get.toNamed(Routes.gridviewScreen);
                          break;
                        case 2:
                          Get.toNamed(Routes.sliverAppbarScreen);
                          break;
                        case 3:
                          Get.toNamed(Routes.sideMenuScreen);
                          break;
                        case 4:
                          Get.toNamed(Routes.bottomMenuScreen);
                          break;
                        case 5:
                          Get.toNamed(Routes.tabsScreen);
                          break;
                        case 6:
                          Get.toNamed(Routes.wizardScreen);
                          break;
                        case 7:
                          Get.toNamed(Routes.splashScreen);
                          break;
                        case 8:
                          Get.toNamed(Routes.progressBarsScreen);
                          break;
                        case 9:
                          Get.toNamed(Routes.textScreen);
                          break;
                        case 10:
                          Get.toNamed(Routes.textFieldsScreen);
                          break;
                        case 11:
                          Get.toNamed(Routes.buttonScreen);
                          break;
                        case 12:
                          Get.toNamed(Routes.chipsGalleryScreen);
                          break;
                        case 13:
                          Get.toNamed(Routes.bottomAppbarScreen);
                          break;
                        case 14:
                          Get.toNamed(Routes.dialogsScreen);
                          break;
                        case 15:
                          Get.toNamed(Routes.socialLoginScreen);
                          break;
                        case 16:
                          Get.toNamed(Routes.profileScreen);
                          break;
                        case 17:
                          Get.toNamed(Routes.searchBarScreen);
                          break;
                        case 18:
                          Get.toNamed(Routes.googleMapScreen);
                          break;
                        case 19:
                          Get.toNamed(Routes.firebaseAdmobScreen);
                          break;
                        }
                      },
                    child: Container(
                      child: Stack(
                          children: [
                            Container(
                                height: 60.w,width: 60.w,
                                decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(2.w),
                              image: DecorationImage(
                                image: AssetImage(data[index].img),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
                              )
                              ),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(data[index].icon,fit: BoxFit.cover,height: 6.w,),
                                  Text(data[index].title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                );
              },
          ),
        ),
      ),
    );
  }
}

class gridViewData{
  String img;
  String title;
  String icon;

  gridViewData({
    required this.img,
    required this.title,
    required this.icon,
  });

}