import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/payments/presentation/pages/payment_page.dart';
import 'package:learning_management/features/profile/data/models/student_profile_model.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:learning_management/features/profile/presentation/pages/student_profile_page.dart';
import 'package:learning_management/features/progress/presentation/pages/progress_page.dart';
import 'package:learning_management/features/routine/presentation/pages/routine_page.dart';
import 'package:learning_management/widgets/network_image_widget.dart';
import 'package:toastification/toastification.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DeferredPointerHandler(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        alignment: Alignment.centerRight,
        color: Colors.transparent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            Container(
              width: 250.w,
              color: Colors.white,
              padding: padding16,
              child: SafeArea(
                child: Column(
                  children: [

                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {

                        Profile? profile = state.studentProfileEntity?.profile;

                        return Column(
                          children: [

                            InkWell(
                              onTap: ()=> context.push(StudentProfilePage.path),
                              child: NetworkImageWidget(
                                profile?.imagePath ?? "",
                                width: 80.w,
                                height: 80.w,
                                borderRadius: radiusCircle,
                              ),
                            ),

                            gap6,

                            Text(
                              profile?.fullName ?? "Not Found",
                              style: AppTextStyles.titleLarge.copyWith(
                                  color: AppColors.blueLight
                              ),
                            ),

                            Text(
                              "Student ID: ${profile?.id ?? "Not Found"}",
                              style: AppTextStyles.caption,
                            ),

                          ],
                        );
                      },
                    ),


                    gap16,

                    const Divider(),

                    _drawerItem(
                        svgImage: "assets/icons/profile_icon.svg",
                        title: "Profile",
                        onPressed: () {
                          context.push(StudentProfilePage.path);
                          Navigator.pop(context);
                        }
                    ),

                    _drawerItem(
                        svgImage: "assets/icons/routine_icon.svg",
                        title: "Routine",
                        onPressed: () {
                          context.push(RoutinePage.path);
                          Navigator.pop(context);
                        }
                    ),

                    _drawerItem(
                        svgImage: "assets/icons/progress_icon.svg",
                        title: "Progress",
                        onPressed: () {
                          context.push(ProgressPage.path);
                          Navigator.pop(context);
                        }
                    ),


                    _drawerItem(
                      svgImage: "assets/icons/payment_icon.svg",
                      title: "Payments",
                      onPressed: () {
                        context.push(PaymentPage.path);
                        Navigator.pop(context);
                      },
                    ),


                    ListTile(
                      leading: Icon(Icons.logout, color: errorColor),
                      title: Text(
                        "Sign Out",
                        style: AppTextStyles.titleSmall,
                      ),
                      onTap: () {
                        context.read<AuthBloc>().add(SignOut());
                        context.go(SignInPage.path);
                        Navigator.pop(context);
                      },
                    ),

                  ],
                ),
              ),
            ),

            Positioned(
              top: 60,
              left: -60,
              child: DeferPointer(
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: CircleAvatar(
                      child: Icon(Icons.close),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
      {required String svgImage, required String title, required VoidCallback onPressed}) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(
            svgImage,
            colorFilter: ColorFilter.mode(
                AppColors.blueLight,
                BlendMode.srcIn
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.titleSmall,
          ),
          onTap: () => onPressed(),
        ),
        const Divider()
      ],
    );
  }
}

