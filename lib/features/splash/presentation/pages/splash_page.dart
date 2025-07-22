import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {


    useEffect((){
      return null;
    },[]);


    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainCenter,
          children: [



          ],
        ),
      ),
    );
  }
}
