import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class HomePage extends StatelessWidget {

  static String get path => "/home";
  static String get name => "home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: 1.sw,
            height: 1.sh,
            padding: paddingTop12,
            child: Column(
              children: [

                Padding(
                  padding: paddingH24,
                  child: Row(
                    children: [

                      SvgPicture.asset(
                        "assets/icons/avatar_icon.svg",
                      ),

                      gap12,

                      Column(
                        children: [

                          Row(
                            children: [
                              Icon(Icons.sunny, color: AppColors.blueLight),

                              gap4,

                              Text(
                                "Good Morning".toUpperCase(),
                                style: AppTextStyles.titleMedium.copyWith(
                                    color: AppColors.blueLight,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),

                          Text(
                            "Madelyn Dias",
                            style: AppTextStyles.titleLarge.copyWith(
                                color: AppColors.blueLight
                            ),
                          )
                        ],
                      ),


                      const Spacer(),


                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            size: 35.sp,
                            color: AppColors.grey,
                          )
                      )

                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: padding24,
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [


                          Container(
                            width: 1.sw,
                            padding: padding12,
                            decoration: BoxDecoration(
                                borderRadius: radius18,
                                color: AppColors.errorRed
                            ),
                            child: Row(
                              children: [

                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.white,
                                  size: 25.sp,
                                ),

                                gap8,

                                Expanded(
                                  child: RichText(
                                      text: TextSpan(
                                          text: "This is account is currently deactived due to failed payment. ",
                                          style: AppTextStyles.caption.copyWith(
                                              color: Colors.white
                                          ),
                                          children: [
                                            TextSpan(
                                                text: "Update payment Method",
                                                style: AppTextStyles.caption.copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),


                          gap12,


                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 1.sw,
                                height: 200.h,
                                padding: padding16,
                                decoration: BoxDecoration(
                                  borderRadius: radius16,
                                  color: AppColors.deepBlue
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
                                right: 0,
                                  child: SvgPicture.asset(
                                    "assets/images/teacher.svg"
                                  )
                              ),

                            ],
                          ),

                          gap12,


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Tasks",
                                style: AppTextStyles.titleLarge.copyWith(
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              TextButton(
                                onPressed: (){},
                                child: Text(
                                  "See All",
                                  style: AppTextStyles.titleSmall.copyWith(
                                    color: AppColors.deepPurpleAccent,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )

                            ],
                          ),


                          Container(
                            width: 1.sw,
                            height: 80.h,
                            padding: padding10,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.5.w,
                                  color: AppColors.grey,
                                ),
                                borderRadius: radius20,
                              ),
                            ),
                            child: Row(
                              children: [

                                SvgPicture.asset(
                                  "assets/images/english_quiz.svg",
                                  width: 65.w,
                                  height: 65.w,
                                ),

                                gap12,

                                Column(
                                  crossAxisAlignment: crossStart,
                                  mainAxisAlignment: mainCenter,
                                  children: [
                                    Text(
                                      "English Quiz",
                                      style: AppTextStyles.titleMedium.copyWith(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    Text(
                                      "English • 12 Quizzes",
                                      style: AppTextStyles.titleSmall.copyWith(
                                        color: AppColors.textGrey
                                      ),
                                    )

                                  ],
                                ),

                                const Spacer(),

                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.deepPurpleAccent,
                                )



                              ],
                            ),
                          ),

                          gap20,

                          Container(
                            width: 1.sw,
                            height: 80.h,
                            padding: padding10,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.5.w,
                                  color: AppColors.grey,
                                ),
                                borderRadius: radius20,
                              ),
                            ),
                            child: Row(
                              children: [

                                SvgPicture.asset(
                                  "assets/images/math_assignment.svg",
                                  width: 65.w,
                                  height: 65.w,
                                ),

                                gap12,

                                Column(
                                  crossAxisAlignment: crossStart,
                                  mainAxisAlignment: mainCenter,
                                  children: [
                                    Text(
                                      "Math Assignment",
                                      style: AppTextStyles.titleMedium.copyWith(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),

                                    Text(
                                      "Math • 6 Questions",
                                      style: AppTextStyles.titleSmall.copyWith(
                                          color: AppColors.textGrey
                                      ),
                                    )

                                  ],
                                ),

                                const Spacer(),

                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.deepPurpleAccent,
                                )



                              ],
                            ),
                          ),

                          gap12,

                          Text(
                            "Subjects",
                            style: AppTextStyles.titleLarge.copyWith(
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          Text(
                            "Recommendations for you",
                            style: AppTextStyles.caption,
                          ),

                          gap12,

                          SizedBox(
                            width: 1.sw,
                            height: 120.h,
                            child: ListView.builder(
                              itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: paddingRight12,
                                    child: ClipRRect(
                                      borderRadius: radius16,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 150.w,
                                            height: 120.h,
                                            padding: padding16,
                                            color: AppColors.deepOrange,
                                            child: Column(
                                              crossAxisAlignment: crossStart,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                SvgPicture.asset(
                                                  "assets/icons/mathmatics_icon.svg"
                                                ),

                                                Text(
                                                  "Mathmatics",
                                                  style: AppTextStyles.titleMedium.copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),


                                          Positioned(
                                              top: -60,
                                              right: -30,
                                              child: SvgPicture.asset(
                                               "assets/images/draw_shape.svg",
                                                colorFilter: ColorFilter.mode(
                                                    AppColors.lightOrange,
                                                    BlendMode.srcIn
                                                ),
                                              )
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
