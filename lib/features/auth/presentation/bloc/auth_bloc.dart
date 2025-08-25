import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/features/auth/data/models/student_model.dart';
import 'package:learning_management/features/auth/domain/entities/otp_entity.dart';
import 'package:learning_management/features/auth/domain/entities/otp_verification_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/standards_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';
import 'package:learning_management/features/auth/domain/usecases/check_user_remember_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/diactivate_account_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/get_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/get_standards_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/remember_user_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/save_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sections_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'package:learning_management/features/auth/presentation/bloc/auth_state.dart';


class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthState.initial()){
    on<SignIn>(_onSignIn);
    on<RememberUser>(_onRememberUser);
    on<CheckRememberUser>(_onCheckRememberUser);
    on<SignUp>(_onSignUp);
    on<SendOTP>(_onSendOTP);
    on<VerifyOTP>(_onVerifyOTP);
    on<ResetPassword>(_onResetPassword);
    on<GetSections>(_onGetSections);
    on<GetStandards>(_onGetStandards);
    on<GetSignInEntity>(_onGetSignInEntity);
    on<SaveSignInEntity>(_onSaveInEntity);
    on<SignOut>(_onSignOut);
    on<DiactivateAccount>(_onDiactivateAccount);
  }


  Future<void> _onSignIn(SignIn event,Emitter<AuthState> emit) async {
    emit(state.copyWith(signInStatus: Status.loading));
    Map<String,dynamic> body = {
      "username" : event.userName,
      "password" : event.password
    };
    var result = await sl<SignInUseCase>().call(params: body);
    result.fold(
        (error)=> emit(state.copyWith(signInStatus: Status.error, message: error.message)),
        (data){
          emit(state.copyWith(
              signInStatus: Status.success,
              signInEntity: data,
              // studentEntity: data.signInData?.student != null ?
              // Student.fromJson(data.signInData!.student!.toJson()).toEntity() : null
          ));
          add(SaveSignInEntity());
          if(event.rememberStudent) add(RememberUser());
        }
    );
  }



  Future<void> _onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signUpStatus: Status.loading));

    Map<String,dynamic> body = {
      "file" : await MultipartFile.fromFile(event.studentPhoto.path),
      "dto" : jsonEncode(
          {
            "email": event.email,
            "fullName": event.studentName,
            "fathersName": event.fathersName,
            "mothersName": event.mothersName,
            "address": event.district,
            "phone": event.phone,
            "gender": event.gender,
            "yearBatch": event.batchYear,
            "sectionId": event.section,
            "password": event.password,
          }
      )
    };
    var result = await sl<SignUpUseCase>().call(params: body);
    result.fold(
            (error) => emit(state.copyWith(signUpStatus: Status.error, message: error.message)),
        (data){
          emit(state.copyWith(signUpStatus: Status.success, userName: data.student?.username, password: event.password, studentEntity: data));
        }
    );
  }


  Future<void> _onSendOTP(SendOTP event, Emitter<AuthState> emit) async {
    emit(state.copyWith(sendingOtpStatus: Status.loading));
    Map<String,dynamic> body = {
      "otpType": "PASSWORD_RESET",
      "phoneNumber": event.phone,
      //"email": "string",
      "notifierType": "SMS"
    };
    var result = await sl<SendOTPUseCase>().call(params: body);
    result.fold(
            (error)=> emit(state.copyWith(sendingOtpStatus: Status.error, message: error.message)),
            (data) => emit(state.copyWith(sendingOtpStatus: Status.success, otpEntity: data))
    );
  }


  Future<void> _onVerifyOTP(VerifyOTP event, Emitter<AuthState> emit) async {
    emit(state.copyWith(verifyOtpStatus: Status.loading));
    Map<String,dynamic> body = {
      "phoneNumber": event.phone,
      "otp": event.otp,
      "otpType": event.fromForgetPassword ? "PASSWORD_RESET" : "SIGN_UP",
    };
    var result = await sl<VerifyOtpUseCase>().call(params: body);
    result.fold(
            (error)=> emit(state.copyWith(verifyOtpStatus: Status.error, message: error.message)),
            (data){
              emit(state.copyWith(verifyOtpStatus: Status.success, otpVerificationEntity: data));
              if(!event.fromForgetPassword){
                add(SignIn(
                    rememberStudent: false,
                    userName: state.userName ?? "",
                    password: state.password ?? ""
                ));
              }
            }
    );
  }



  Future<void> _onResetPassword(ResetPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resetPasswordStatus: Status.loading));
    Map<String,dynamic> body = {
      "resetToken": event.resetToken,
      "newPassword": event.newPassword
    };
    var result = await sl<ResetPasswordUseCase>().call(params: body);
    result.fold(
            (error)=> emit(state.copyWith(resetPasswordStatus: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(resetPasswordStatus: Status.success))
    );
  }




  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<SignOutUseCase>().call();
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(AuthState.initial())
    );
  }


  Future<void> _onGetSections(GetSections event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<SectionsUseCase>().call(params: event.query);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, sectionsEntity: data))
    );
  }


  Future<void> _onGetStandards(GetStandards event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetStandardsUseCase>().call();
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, standardsEntity: data))
    );
  }


  Future<void> _onSaveInEntity(SaveSignInEntity event,Emitter<AuthState> emit) async {
    emit(state.copyWith(signInStatus: Status.loading));
    var result = await sl<SaveSignInEntityUseCase>().call(params: state.signInEntity);
    result.fold(
            (error)=> emit(state.copyWith(signInStatus: Status.error, message: error.message)),
            (data){
              emit(state.copyWith(signInStatus: Status.success));
            }
    );
  }


  Future<void> _onGetSignInEntity(GetSignInEntity event,Emitter<AuthState> emit) async {
    //emit(state.copyWith(signInStatus: Status.loading));
    var result = await sl<GetSignInEntityUseCase>().call();
    result.fold(
            (error)=> emit(state.copyWith(signInStatus: Status.error, message: error.toString())),
            (data)=> emit(state.copyWith(
              signInStatus: Status.success,
            signInEntity: data,
            // studentEntity: data?.signInData?.student != null ?
            // Student.fromJson(data!.signInData!.student!.toJson()).toEntity() : null
        ))
    );
    add(CheckRememberUser());
  }


  Future<void> _onRememberUser(RememberUser event, Emitter<AuthState> emit) async {
    var result = await sl<RememberUserUseCase>().call();
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(rememberUser: true))
    );
  }

  Future<void> _onCheckRememberUser(CheckRememberUser event, Emitter<AuthState> emit) async {
    var result = await sl<CheckUserRememberUseCase>().call();
    result.fold(
            (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
            (data)=> emit(state.copyWith(rememberUser: data))
    );
  }


  Future<void> _onDiactivateAccount(DiactivateAccount event, Emitter<AuthState> emit) async {
    emit(state.copyWith(accountDiativateStatus: Status.loading));
    var result = await sl<DiactivateAccountUseCase>().call(params: event.studentId);
    result.fold(
            (error)=> emit(state.copyWith(accountDiativateStatus: Status.error, message: error.message)),
            (data){
              if(data){
                add(SignOut());
              }
            }
    );
  }


}