import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DialogsPage extends StatefulWidget {
   String title;
   DialogsPage({super.key,this.title = 'Dialog Gallery'});

  @override
  State<DialogsPage> createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  @override
  Widget build(BuildContext context) {
    List dialogList = [
      "Alert","Alert with Title","Alert with Buttons","Alert Buttons Only","Action Sheet","Material Alert Dialog","Material Alert with Title Dialog",
      "Material time Picker Dialog","Date Picker Dialog","Custom  Dialog"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
        title: Text(widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5.w),
          child: Stack(
            children: [
              Image.asset(ImagePath.bgimg,fit: BoxFit.cover,height: double.infinity,),
              Container(
                child: ListView.builder(
                    itemCount: dialogList.length,shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(2.w),
                        child: InkWell(
                          onTap: () {
                            switch(index){
                              case 0:
                                showAlertDialog(context);
                                break;
                              case 1:
                                showAlert(context);
                                break;
                              case 2:
                                showAlertButton(context);
                                break;
                              case 3:
                                showAlertButtonOnly(context);
                                break;
                              case 4:
                                showActionSheets(context);
                                break;
                              case 5:
                                showMaterialAlert(context);
                                break;
                              case 6:
                                showAlert(context);
                                break;
                              case 7:
                                showTimePickers(context);
                                break;
                              case 8:
                                showDatePickers(context);
                                break;
                              case 9:
                                showCustomDialogs(context);
                                break;
                            }
                          },
                          child: Container(width: 80.w,height: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.w),
                              image: DecorationImage(
                                image: AssetImage(ImagePath.conImg,),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                dialogList[index],
                                style: TextStyle(color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Discard draft?'),
          actions: <Widget>[
            TextButton(
                onPressed: () => Get.back(),
                child: Text('Discard',style: TextStyle(color: Theme.of(context).dividerColor),)),
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel',style: TextStyle(color: Theme.of(context).disabledColor,fontWeight: FontWeight.w600),),
            )
          ],
        );
        },
    );
  }

  showAlert(BuildContext context) {
    String content =
        "Let Google help apps determine location.""\n"
        " This means sending anonymous location ""\n"
        "data to Google, even when no apps are "'\n'
        "running.";
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.w)
      ),
      title: Text("Use Google's location service?",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
      content:  Container(
          child: Text(content,maxLines: 4,style: TextStyle(fontSize: 10.sp),)),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(onTap: () => Get.back(),
              child: Container(
                height: 5.h,width: 22.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(1.w)
                ),
                child: Center(
                    child: Text('DISAGREE',style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 10.sp),)),
              ),
            ),SizedBox(width: 2.w,),
            InkWell(onTap: () => Get.back(),
              child: Container(
                height: 5.h,width: 22.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(1.w)
                ),
                child: Center(
                    child: Text('AGREE',style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 10.sp),)),
              ),
            ),
          ],
        ),

      ],
      actionsAlignment:MainAxisAlignment.center,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {return alert;},
    );
  }

  showAlertButton(BuildContext context) {
    String content =
        " Please select your favorite Fruit ""\n"
        "from the list below. Your selection ""\n"
        "   will be used to customize the ""\n"
        "  suggested list of eateries in your""\n"
        "            area.";
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Select Favorite Fruit"),
            actions: [
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Apple",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Banana",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Cherry",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Mango",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Grapes",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Orange",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("PineApple",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Cancel",style: TextStyle(color: Theme.of(context).dividerColor),)),
            ],
            content: Text(content,),
          );
        },
    );
  }

  showAlertButtonOnly(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Apple",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Banana",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Cherry",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Mango",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Grapes",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Orange",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("PineApple",style: TextStyle(color: Theme.of(context).disabledColor),)),
              CupertinoDialogAction(onPressed: () => Get.back(), child: Text("Cancel",style: TextStyle(color: Theme.of(context).dividerColor),)),
            ],
          );
        },
    );
  }

  showActionSheets(BuildContext context){
    showCupertinoModalPopup(
       context: context,
       builder: (context) {
         return CupertinoActionSheet(
           title: Text('Favorite Fruit'),
           message: Text('Please select the favorite fruit you want to buy.'),
           cancelButton: CupertinoActionSheetAction(
             child: Text("Cancel",style: TextStyle(color: Theme.of(context).disabledColor,fontWeight: FontWeight.w600),),
             onPressed: () => Get.back(),
           ),
           actions: <Widget>[
             CupertinoActionSheetAction(
               child:  Text('Apple',style: TextStyle(color: Theme.of(context).disabledColor),),
               onPressed: () => Get.back(),
             ),
             CupertinoActionSheetAction(
               child:  Text('Banana',style: TextStyle(color: Theme.of(context).disabledColor),),
               onPressed: () => Get.back(),
             ),
             CupertinoActionSheetAction(
               child:  Text('Mango',style: TextStyle(color: Theme.of(context).disabledColor),),
               onPressed: () => Get.back(),
             ),
           ],
         );
       },
   );
  }

  showMaterialAlert(BuildContext context){
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.w)
      ),
      title: Text("Discard draft?",style: TextStyle(fontSize: 11.sp),),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(onTap: () => Get.back(),
              child: Container(
                height: 5.h,width: 22.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(1.w)
                ),
                child: Center(
                    child: Text('CANCEL',style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 10.sp),)),
              ),
            ),SizedBox(width: 2.w,),
            InkWell(onTap: () => Get.back(),
              child: Container(
                height: 5.h,width: 22.w,
                decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.circular(1.w)
                ),
                child: Center(
                    child: Text('DISCARD',style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 10.sp),)),
              ),
            ),
          ],
        ),
      ],
      actionsAlignment:MainAxisAlignment.center,
    );
    showDialog(
      context: context,
      builder: (context) {
        return alert;
        },
    );

  }

  showTimePickers(BuildContext context){
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );
  }

  showDatePickers(BuildContext context){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2030),
       builder: (context, child) {
         return Theme(
           data: Theme.of(context),
           child: child!,
         );
       },
    );
  }

  showCustomDialogs(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;
          return Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: Dialog(
                backgroundColor: Colors.transparent, //must have
                elevation: 0,
                child: SizedBox(
                  height: size.height * .6,
                  child: Stack(
                    children: [
                      Positioned(
                          top: (size.height * .2) / 2,
                          child: Container(
                            height: 33.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.w),
                              color: Theme.of(context).primaryColorDark,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.w,right: 4.w,left: 4.w),
                              child: Column(
                                children: [
                                  Text('Confirmation',style: TextStyle(color: Theme.of(context).backgroundColor,fontWeight: FontWeight.w600,fontSize: 18.sp),),
                                  SizedBox(height: 2.w,),
                                  Text(
                                      'Your Application related issue will be '"\n"
                                          '                submit at out server'
                                  ),
                                  SizedBox(height: 7.w,),
                                  Align(alignment: Alignment.bottomRight,
                                    child: InkWell(onTap: () => Get.back(),
                                      child: Container(
                                        height: 5.h,width: 22.w,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).backgroundColor,
                                            borderRadius: BorderRadius.circular(4.w)
                                        ),
                                        child: Center(
                                            child: Text('Submit',style: TextStyle(color: Theme.of(context).primaryColorDark),)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding:  EdgeInsets.only(top: 5.w),
                          child: Container(
                            height: 14.h,
                            width: 30.w,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              image: DecorationImage(
                                image: AssetImage(
                                  ImagePath.dialogImg
                                ),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
