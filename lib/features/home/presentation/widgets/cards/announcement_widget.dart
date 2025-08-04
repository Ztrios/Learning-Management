import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/helpers.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_event.dart';
import 'package:learning_management/features/home/presentation/pages/announcements_page.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/announcement_item_view.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:learning_management/features/home/presentation/widgets/loading_widgets/announcement_loading_widget.dart';
import 'package:learning_management/features/home/presentation/widgets/section_header.dart';
import 'package:learning_management/widgets/error_widget/error_widget.dart';

import '../../../data/models/announcement_model.dart';

class AnnouncementWidget extends HookWidget {
  const AnnouncementWidget({
    super.key,
  });

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


    useEffect(() {
      Future.microtask(() {
        context.read<HomeBloc>().add(GetAnnouncement());
      });
      return null;
    }, []);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if(state.status.isLoading){
          return AnnouncementLoadingWidget();
        } else if(state.status.isSuccess &&  (state.announcementsEntity?.announcementsData?.content).isNotNullAndNotEmpty){
          return Column(
            children: [

              SectionHeader(
                title: "Announcement",
                onPressed: ()=> context.pushNamed(AnnouncementsPage.name),
              ),

              FlutterCarousel.builder(
                itemCount: state.announcementsEntity!.announcementsData!.content!.length,
                options: FlutterCarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  height: 150.h,
                  enableInfiniteScroll: false,
                  physics: BouncingScrollPhysics(),
                  showIndicator: false,
                ),
                itemBuilder: (context, index, child) {
                  Content content = state.announcementsEntity!.announcementsData!.content![index];

                  return AnnouncementItemView(
                    onPressed: () {
                      if(content.filePath != null){
                        Helpers.launchUri(uri: content.filePath!);
                      }
                    },
                    isExpanded: false,
                    title: content.title ?? "Not Found",
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    backgroundColor: background[index % background.length],
                  );
                },
              ),
            ],
          );
        }else if(state.status.isError){
          return ErrorViewWidget(
              message: state.message ?? "Not Found"
          );
        }else{
          return SizedBox.shrink();
        }

      },
    );
  }
}
