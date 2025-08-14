import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/data/models/announcement_model.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/announcement_item_view.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';

class AnnouncementsPage extends HookWidget {
  static String get path => "/announcements";

  static String get name => "announcements";

  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {


    final List<Color> background = [
      Color(0xFF2E7D32), // Deep Green
      Color(0xFF1565C0), // Bright Blue
      Color(0xFFC62828), // Strong Red
      Color(0xFF6A1B9A), // Purple
      Color(0xFF00897B), // Teal
      Color(0xFFEF6C00), // Orange
      Color(0xFF37474F), // Blue Grey
      Color(0xFFAD1457), // Raspberry Pink
      Color(0xFF0097A7), // Cyan
      Color(0xFF5D4037), // Brown
    ];


    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              SecondaryAppBar(
                  title: "Announcement"
              ),

              gap12,

              Expanded(
                child: Padding(
                  padding: paddingH16,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return ListView.builder(
                          itemCount: state.announcementsEntity?.announcementsData?.content?.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {

                            Content content = state.announcementsEntity!.announcementsData!.content![index];

                            return Padding(
                              padding: paddingBottom12,
                              child: AnnouncementItemView(
                                onPressed: () {
                                  if(content.filePath != null){
                                    Helpers.launchUri(uri: content.filePath!);
                                  }
                                },
                                title: content.title ?? "Not Found",
                                content: content.content ?? "Not Found",
                                backgroundColor: background[index % background.length].withValues(alpha: 0.8),
                                isExpanded: true,
                              ),
                            );
                          }
                      );
                    },
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
