import 'package:flutter/material.dart';
import 'package:flutter_ui_components/Constants/ImagePath.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SimpleSliverAppBar extends StatelessWidget {
   String title;
   SimpleSliverAppBar({super.key,this.title = 'City Place, Agra'});

  @override
  Widget build(BuildContext context) {

    String agraDetails =
        " Agra is a city on the banks of the Yamuna river in the Indian state of "
        "Uttar Pradesh,about 230 kilometres south-east of the national capital"
        " Delhi and 330 km west of the state capital Lucknow.Agra's notable "
        "historical period began during Sikandar Lodi's reign, but the golden "
        "age of the city began with the Mughals. Agra was the foremost city of "
        "the Indian subcontinent and the capital of the Mughal Empire under "
        "Mughal emperors Babur, Humayun, Akbar, Jahangir and Shah Jahan. ""\n"
        "  Under Mughal rule, Agra became a centre for learning, arts, commerce,"
        " and religion, and saw the construction of the Agra Fort, Sikandra and"
        " Agra's most prized monument, the Taj Mahal, constructed between 1632 "
        "and 1648 by Shah Jahan in remembrance of his wife Mumtaz Mahal. With "
        "the decline of the Mughal empire in the late 18th century, the city "
        "fell successively first to Marathas and later to the East India Company."
        " After Independence, Agra has developed into an industrial town, with "
        "a booming tourism industry, along with footwear, leather and other "
        "manufacturing. The Taj Mahal and the Agra Fort are UNESCO World "
        "Heritage Sites. ""\n"
        "  The city features mild winters, hot and dry summers and a monsoon "
        "season, and is famous for its Mughlai cuisine. Agra is included on "
        "the Golden Triangle tourist circuit, along with Delhi and Jaipur; and"
        " the Uttar Pradesh Heritage Arc, a tourist circuit of Uttar Pradesh, "
        "along with Lucknow and Varanasi.Agra has two histories: one of the "
        "ancient city on the east, or left, bank of the river Yamuna, going "
        "back so far as to be lost in the legends of Krishna and Mahabharata "
        "and reestablished by Sikandar Lodhi in 1504–1505; the other of the "
        "modern city, founded by Akbar in 1558, on the right bank of the river"
        " which is associated with the Mughals, and known throughout the world "
        "as the city of the Taj. ""\n"
        "  Of ancient Agra little now remains except few traces of the "
        "foundations.It was a place of importance under various Hindu dynasties"
        " previous to the Muslim invasions of India, but its history is unclear,"
        " and possess little historical interest. The 17th century chronicler"
        " named Abdhullah said it was a village before the reign of Sikandar Lodi.""\n"
        " The king of Mathura had used the Agra fort as a jail. The degradation "
        "in the status of the site was a result of the destruction brought upon "
        "it by Mahmud of Ghazni. Masud Sa'd Salman claims to have been there"
        " when Mahmud assaulted Agra, claiming the Raja Japal surrendered after "
        "seeing a nightmare. Mahmud however proceeds to pillage the city.";

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,scrollDirection: Axis.vertical,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
         [ SliverAppBar(
            expandedHeight: 35.h,
           backgroundColor: Theme.of(context).secondaryHeaderColor,
           leading: IconButton(
             onPressed: () => Get.back(),
             icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColorDark,),),
           flexibleSpace: FlexibleSpaceBar(
             title: Text(title,style: TextStyle(color: Theme.of(context).primaryColorDark,fontSize: 14.sp,fontWeight: FontWeight.w600),),
             background: Image.asset(ImagePath.cityImg,fit: BoxFit.cover,),
           ),
           snap: true,pinned: true,floating: true,
          ),],
          body:SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(2.w),
              child: Text(agraDetails,style: TextStyle(color: Colors.black),),
            ),
          ),
        ),
      ),
    );
  }
}
