part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status status;
  final String? message;
  final Status signInStatus;
  final Status signUpStatus;
  final Status sendingOtpStatus;
  final Status verifyOtpStatus;
  final Status resetPasswordStatus;
  final bool rememberUser;
  final SectionsEntity? sectionsEntity;
  final StandardsEntity? standardsEntity;
  final SignInEntity? signInEntity;
  final StudentEntity? studentEntity;
  final OtpEntity? otpEntity;
  final OtpVerificationEntity? otpVerificationEntity;

  const AuthState({
    required this.status,
    required this.message,
    required this.signInStatus,
    required this.signUpStatus,
    required this.sendingOtpStatus,
    required this.verifyOtpStatus,
    required this.resetPasswordStatus,
    required this.rememberUser,
    required this.sectionsEntity,
    required this.standardsEntity,
    required this.studentEntity,
    required this.signInEntity,
    required this.otpEntity,
    required this.otpVerificationEntity
  });

  /// Initial state factory
  factory AuthState.initial() => const AuthState(
    status: Status.initial,
    message: null,
    signInStatus: Status.initial,
    signUpStatus: Status.initial,
    sendingOtpStatus: Status.initial,
    verifyOtpStatus: Status.initial,
    resetPasswordStatus: Status.initial,
    rememberUser: false,
    sectionsEntity: null,
    standardsEntity: null,
    signInEntity: null,
    studentEntity: null,
    otpEntity: null,
    otpVerificationEntity: null
  );

  /// Copy with new values
  AuthState copyWith({
    Status? status,
    String? message,
    Status? signInStatus,
    Status? signUpStatus,
    Status? sendingOtpStatus,
    Status? verifyOtpStatus,
    Status? resetPasswordStatus,
    bool? rememberUser,
    SectionsEntity? sectionsEntity,
    StandardsEntity? standardsEntity,
    SignInEntity? signInEntity,
    StudentEntity? studentEntity,
    OtpEntity? otpEntity,
    OtpVerificationEntity? otpVerificationEntity,
  }) {
    return AuthState(
      status:  status ?? this.status,
      message: message ?? this.message,
      signInStatus: signInStatus ?? this.signInStatus,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      sendingOtpStatus: sendingOtpStatus ?? this.sendingOtpStatus,
      verifyOtpStatus: verifyOtpStatus ?? this.verifyOtpStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      rememberUser: rememberUser ?? this.rememberUser,
      sectionsEntity: sectionsEntity ?? this.sectionsEntity,
      standardsEntity: standardsEntity ?? this.standardsEntity,
      signInEntity: signInEntity ?? this.signInEntity,
      studentEntity: studentEntity ?? this.studentEntity,
      otpEntity: otpEntity ?? this.otpEntity,
      otpVerificationEntity: otpVerificationEntity ?? this.otpVerificationEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    signInStatus,
    signUpStatus,
    sendingOtpStatus,
    verifyOtpStatus,
    resetPasswordStatus,
    rememberUser,
    sectionsEntity,
    standardsEntity,
    signInEntity,
    studentEntity,
    otpEntity,
    otpVerificationEntity
  ];
}
