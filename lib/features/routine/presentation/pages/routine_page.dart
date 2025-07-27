import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_bloc.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_event.dart';
import 'package:learning_management/features/routine/presentation/widgets/routine_date_selection_widget.dart';
import 'package:learning_management/features/routine/presentation/widgets/routine_list_widget.dart';
import 'package:learning_management/widgets/app_bars/primary_app_bars.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class RoutinePage extends HookWidget {
  static String get path => "/routine";
  static String get name => "routine";

  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {


    void getTodaysRoutine(){
      int? sectionId = context.read<AuthBloc>().state.signInEntity?.signInData?.standardId;
      if(sectionId != null){
        context.read<RoutineBloc>().add(GetClassRoutines(
            sectionID: sectionId.toString(),
            selectedDateTime: DateTime.now()
        ));
      }
    }


    useEffect((){
      Future.microtask(()=> getTodaysRoutine());
      return null;
    },[]);

    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        padding: paddingTop12,
        color: AppColors.background,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [

            PrimaryAppBar(),

            gap12,

            Expanded(
              child: Padding(
                padding: paddingH24,
                child: Column(
                  children: [

                    Row(
                      children: [
                        Text(
                          DateTime.now().day.toString(),
                          style: AppTextStyles.displayLarge,
                        ),

                        gap4,

                        Text(
                          "Wed\nJan\n2025",
                          style: AppTextStyles.caption,
                        ),

                        const Spacer(),

                        Container(
                          width: 83.w,
                          height: 40.h,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4DC591).withValues(alpha: 0.2),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "Today",
                            style: AppTextStyles.titleMedium.copyWith(
                              color: const Color(0xFF4DC591),
                              fontWeight: FontWeight.w900
                            ),
                          ),
                        ),

                      ],
                    ),

                    RoutineDateSelectionWidget(),

                    const Divider(),

                    Expanded(
                      child: RoutineListWidget(),
                    )

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
