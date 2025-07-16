import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class ClassRoutineWidget extends HookWidget {
  const ClassRoutineWidget({super.key});

  @override
  Widget build(BuildContext context) {

     final size = useState<double>(150.w);
     final asset = useState<String>("assets/images/teacher.svg");
     final background = useState<Color>(AppColors.deepBlue);
    
     setRoutineInterface(){
      int index = Random().nextInt(5);
      switch(index){
        case 0:
          size.value = 150.w;
          background.value = AppColors.deepBlue;
          asset.value = "assets/images/teacher.svg";
        case 1:
          size.value = 120.w;
          asset.value = "assets/images/global_learning.svg";
          background.value = AppColors.deepGreen;
        case 2:
          size.value = 150.w;
          asset.value = "assets/images/exam_scene.svg";
          background.value = AppColors.deepPink;
        case 3:
          size.value = 150.w;
        asset.value = "assets/images/online_learning.svg";
          background.value = AppColors.tealBlue;
        case 4:
          size.value = 150.w;
          asset.value = "assets/images/pdf_learning.svg";
          background.value = AppColors.deepRed;

      }
    }

    useEffect((){
      Future.microtask(()=> setRoutineInterface());
      return null;
    },[]);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 1.sw,
          height: 210.h,
          padding: padding16,
          decoration: BoxDecoration(
              borderRadius: radius16,
              color: background.value
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        "Class 03",
                        style: AppTextStyles.titleSmall.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Text(
                        "Mathematics & English",
                        style: AppTextStyles.caption.copyWith(
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: padding4,
                    decoration: BoxDecoration(
                        borderRadius: radius8,
                        color: AppColors.lightOrange
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: AppColors.deepBlue,
                        ),

                        gap4,

                        Text(
                          "03:04:35",
                          style: AppTextStyles.titleSmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.deepBlue
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),


              gap24,

              Text(
                "Zoom ID : 33467784",
                style: AppTextStyles.caption.copyWith(
                    color: Colors.white
                ),
              ),

              Text(
                "Password : Eng3355sd",
                style: AppTextStyles.caption.copyWith(
                    color: Colors.white
                ),
              ),



              gap20,

              Row(
                children: [

                  CircleAvatar(
                    radius: 12.r,
                    backgroundImage: NetworkImage(
                      "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg",
                    ),
                  ),

                  gap10,

                  Text(
                    "Julie Watson",
                    style: AppTextStyles.caption.copyWith(
                        color: Colors.white
                    ),
                  )

                ],
              ),

              gap6,

              Row(
                children: [

                  CircleAvatar(
                    radius: 12.r,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1695927621677-ec96e048dce2?fm=jpg",
                    ),
                  ),

                  gap10,

                  Text(
                    "Brooklyn Williamson",
                    style: AppTextStyles.caption.copyWith(
                        color: Colors.white
                    ),
                  )

                ],
              ),




            ],
          ),
        ),

        Positioned(
            bottom: 0,
            right: -20,
            child: SvgPicture.asset(
              asset.value,
              width: size.value,
              height: size.value,
              fit: BoxFit.cover,
            )
        ),

      ],
    );
  }
}
