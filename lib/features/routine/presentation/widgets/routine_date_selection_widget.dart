import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_bloc.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_event.dart';

class RoutineDateSelectionWidget extends HookWidget {
  const RoutineDateSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {


    void getClassRoutines(DateTime dateTime){
      int? sectionId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.section?.id;
      if(sectionId != null){
        context.read<RoutineBloc>().add(GetClassRoutines(
            sectionID: sectionId.toString(),
            selectedDateTime: dateTime
        ));
      }
    }

    return BlocBuilder<RoutineBloc, RoutineState>(
      builder: (context, state) {
        return EasyDateTimeLinePicker.itemBuilder(
          firstDate: DateTimeFormatters.getStartOfBDWeek(),
          lastDate: DateTimeFormatters.getEndOfBDWeek(),
          focusedDate: state.selectedDate,
          daySeparatorPadding: 0,
          physics: BouncingScrollPhysics(),
          itemExtent: 65.w,
          headerOptions: HeaderOptions(
              headerType: HeaderType.none
          ),
          itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
            return InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: radius16,
                  color: isSelected ? AppColors.deepOrange : null,
                ),
                child: Column(
                  crossAxisAlignment: crossCenter,
                  mainAxisAlignment: mainCenter,
                  children: [
                    Text(
                      DateTimeFormatters.formatDayOfWeekShort(dateTime: date),
                      style: AppTextStyles.titleMedium.copyWith(
                          color: isSelected ? Colors.white : AppColors.textGrey,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    Text(
                      date.day.toString(),
                      style: AppTextStyles.titleMedium.copyWith(
                          color: isSelected ? Colors.white : null,
                          fontWeight: FontWeight.w900
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          onDateChange: getClassRoutines,
        );
      },
    );
  }
}
