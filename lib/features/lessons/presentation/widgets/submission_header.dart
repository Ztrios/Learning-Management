import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';

class SubmissionHeader extends StatefulWidget {
  final int totalMarks;
  final String title;
  final DateTime endTime;

  const SubmissionHeader({
    super.key,
    required this.title,
    required this.totalMarks,
    required this.endTime,
  });

  @override
  State<SubmissionHeader> createState() => _SubmissionHeaderState();
}

class _SubmissionHeaderState extends State<SubmissionHeader> {

  /// Returns a countdown stream until the end time
  Stream<Duration> countdownStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      final remaining = widget.endTime.difference(DateTime.now());
      if (remaining.inSeconds <= 0) {
        yield Duration.zero;
        break;
      }
      yield remaining;
    }
  }

  /// Format Duration like 23:48
  String formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    final s = d.inSeconds % 60;
    return "${h}h ${m}m ${s}s";
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: paddingV6,
      padding: padding16,
      decoration: BoxDecoration(
        color: AppColors.deepOrange.withValues(alpha: 0.2),
        borderRadius: radius20,
        border: Border.all(width: 1.w, color: Colors.deepOrange),
      ),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: AppColors.deepGreen,
              borderRadius: radius6,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          gap12,
          Column(
            crossAxisAlignment: crossStart,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text("Marks: ${widget.totalMarks}",
                      style: AppTextStyles.bodyMedium),
                  StreamBuilder<Duration>(
                    stream: countdownStream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading...",
                            style: AppTextStyles.caption.copyWith(
                                color: AppColors.errorRed));
                      }

                      final remaining = snapshot.data!;
                      return Text(
                        remaining.inSeconds <= 0
                            ? "Time's up"
                            : "Remaining: ${formatDuration(remaining)}",
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.errorRed,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
