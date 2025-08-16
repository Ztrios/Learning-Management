import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/notifications/presentation/pages/notifications_page.dart' show NotificationsPage;
import 'package:learning_management/features/profile/data/models/student_profile_model.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_event.dart';
import 'package:learning_management/features/profile/presentation/pages/student_profile_page.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class PrimaryAppBar extends HookWidget {
  const PrimaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {


    void getStudentProfile() {
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if (studentId != null) {
        context.read<ProfileBloc>().add(
          GetStudentProfile(studentId: studentId.toString()),
        );
      }
    }
    

    useEffect(() {
      Future.microtask(() => getStudentProfile());
      return null;
    }, []);


    return BlocBuilder<ProfileBloc, ProfileState>(
  builder: (context, state) {

    Profile? profile = state.studentProfileEntity?.profile;

    return Padding(
      padding: paddingH20,
      child: Row(
        children: [

          InkWell(
            onTap: ()=> context.push(StudentProfilePage.path),
            child: NetworkImageWidget(
              profile?.imagePath ?? "",
              width: 50.w,
              height: 50.w,
              borderRadius: radiusCircle,
            ),
          ),



          gap12,

          Column(
            crossAxisAlignment: crossStart,
            children: [

              Row(
                children: [
                  Icon(
                      DateTimeFormatters.getGreetingIcon(),
                      color: AppColors.blueLight
                  ),

                  gap4,

                  Text(
                    DateTimeFormatters.getBangladeshGreeting().toUpperCase(),
                    style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.blueLight,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),

              Text(
                profile?.fullName ?? "Not Found",
                style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.blueLight
                ),
              )
            ],
          ),


          const Spacer(),

          // IconButton(
          //     onPressed: ()=> context.push(NotificationsPage.path),
          //     icon: Icon(
          //       Icons.notifications,
          //       size: 30.sp,
          //       color: AppColors.deepPurpleAccent
          //     )
          // ),

          gap6,

          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/menu_icon.svg"
                  )
              );
            }
          )

        ],
      ),
    );
  },
);
  }
}
