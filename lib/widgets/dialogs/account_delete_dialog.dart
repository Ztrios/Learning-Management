import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/splash/presentation/pages/splash_page.dart';

Future<void> showAccountDeleteDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap a button
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Delete Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        content: const Text(
          'Are you sure you want to delete your account? '
              'This action cannot be undone.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
              if(studentId != null){
                context.read<AuthBloc>().add(DiactivateAccount(studentId: studentId.toString()));
                context.go(SplashPage.path);
                Navigator.pop(context);
                ToastNotifications.showErrorToast(
                  title: "Account Deleted",
                  message: "Your account and all associated data have been permanently removed.",
                  alignment: Alignment.topCenter,
                );
              }
            },
            child: Text('Delete', style: TextStyle(color: Colors.white),),
          ),
        ],
      );
    },
  );
}
