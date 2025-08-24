import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/helpers/validation/form_validations.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:learning_management/features/auth/presentation/pages/forget_password_page.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/auth/presentation/pages/reset_password_page.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationPage extends HookWidget {
  static String get path => "/otp-verification";
  static String get name => "otp-verification";

  final String phone;

  const OTPVerificationPage({
    super.key,
    required this.phone,
  });

  /// countdown generator
  Stream<int> countdownUntil(DateTime target) async* {
    while (true) {
      final now = DateTime.now().toUtc();
      final remaining = target.difference(now).inSeconds;
      if (remaining <= 0) {
        yield 0;
        break;
      } else {
        yield remaining;
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final otpController = useTextEditingController();

    void verifyOTP() {
      if (formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
          VerifyOTP(phone: phone, otp: otpController.text),
        );
      }
    }

    /// 🔹 countdown based on backend provided time
    final streamState = useState<Stream<int>>(countdownUntil(context.read<AuthBloc>().state.otpEntity?.otpData?.otpResendTime ?? DateTime.now()));
    final snapshot = useStream(streamState.value);

    void resendOTP() {
      debugPrint("Resend Email API called ✅");

      // 👉 Call Bloc to request new OTP
      context.read<AuthBloc>().add(SendOTP(phone: phone));

      // 🔹 Update countdown with new server-provided otpResendTime
      final newResendTime = DateTime.now().toUtc().add(const Duration(minutes: 2));
      streamState.value = countdownUntil(newResendTime);
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: padding24,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.blueLight.withValues(alpha: 0.1),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Padding(
                        padding: paddingLeft4,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.blueLight,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              gap48,

              Text(
                "Check your phone",
                style: AppTextStyles.titleLarge,
              ),

              gap6,

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyles.caption,
                  children: [
                    const TextSpan(text: "We sent a reset link to "),
                    TextSpan(
                      text: phone,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const TextSpan(
                      text:
                      " enter the 6 digit code that was mentioned in the email",
                    ),
                  ],
                ),
              ),

              gap48,

              Form(
                key: formKey,
                child: Pinput(
                  controller: otpController,
                  length: 6,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: defaultPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  validator: (value) => FormValidation(
                    validationType: ValidationType.otp,
                    formValue: value,
                  ).validate(),
                  cursor: Container(
                    width: 2.5.w,
                    margin: margin12,
                    color: AppColors.blueLight,
                  ),
                ),
              ),

              gap24,

              BlocConsumer<AuthBloc, AuthState>(
                listenWhen: (previous, current) =>
                previous.verifyOtpStatus.isLoading &&
                    current.verifyOtpStatus.isSuccess,
                listener: (context, state) {
                  final String? token =
                      state.otpVerificationEntity?.otpVerificationData?.resetToken;
                  if (token.isNotNullAndNotEmpty) {
                    context.pushReplacement(
                        "${SignInPage.path}${ForgetPasswordPage.path}${OTPVerificationPage.path}/$phone${ResetPasswordPage.path}/$token");
                  }
                },
                builder: (context, state) {
                  return PrimaryButton(
                    isLoading: state.verifyOtpStatus.isLoading,
                    onPressed: () => verifyOTP(),
                    text: "Verify Code",
                  );
                },
              ),

              gap12,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!snapshot.hasData || snapshot.data == 0) ...[
                    Text(
                      "Haven’t got the email yet?",
                      style: AppTextStyles.bodySmall,
                    ),
                    TextButton(
                      onPressed: resendOTP,
                      child: Text(
                        "Resend email",
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueLight,
                        ),
                      ),
                    ),
                  ] else ...[
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "Resend email in ",
                            style: AppTextStyles.bodySmall,
                          ),
                          TextSpan(
                            text: "${snapshot.data}s",
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.blueLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(30, 60, 87, 1),
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration,
);
