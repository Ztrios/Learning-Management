import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_bloc.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_event.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_bar/lession_details_tab_bar.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/lession_item_view.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';

class LessionDetailsPage extends HookWidget {

  static String get path => "/lession-details";
  static String get name => "lession-details";

  final String lessionId;

  const LessionDetailsPage({
    super.key,
    required this.lessionId
  });

  @override
  Widget build(BuildContext context) {

    void getLessionDetails(){
      context.read<LessionsBloc>().add(GetLessionDetails(lessionId: lessionId));
    }

    useEffect((){
      Future.microtask(()=> getLessionDetails());
      return null;
    },[]);

    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
        
              const SecondaryAppBar(
                title: "Lession Details",
              ),

              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  padding: paddingH24,
                  child: Column(
                    children: [

                      LessionItemView(
                        title: "Lesson 1: Integration",
                        isCompleted: true
                      ),

                      Expanded(
                        child: LessionDetailsTabBar(
                          lessionId: lessionId,
                        )
                      )

                    ],
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
