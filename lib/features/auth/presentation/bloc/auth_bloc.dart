import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/features/auth/data/models/student_model.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';
import 'package:learning_management/features/auth/domain/usecases/check_user_remember_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/get_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/remember_user_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/save_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sections_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_up_usecase.dart';
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
    on<ResetPassword>(_onResetPassword);
    on<GetSections>(_onGetSections);
    on<GetSignInEntity>(_onGetSignInEntity);
    on<SaveSignInEntity>(_onSaveInEntity);
    on<SignOut>(_onSignOut);
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
              studentEntity: data.signInData?.student != null ?
              StudentModel.fromJson(data.signInData!.student!.toJson()).toEntity() : null
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
            "yearBatch": event.batchYear,
            "sectionId": event.section,
            "password": event.password,
          }
      )
    };
    var result = await sl<SignUpUseCase>().call(params: body);
    result.fold(
            (error) => emit(state.copyWith(signUpStatus: Status.error, message: error.message)),
        (data) => emit(state.copyWith(signUpStatus: Status.success, studentEntity: data))
    );
  }




  Future<void> _onResetPassword(ResetPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resetPasswordStatus: Status.loading));
    Map<String,dynamic> body = {
      "username" : event.userName,
      "phoneNumber": event.phone,
      "newPassword" : event.password
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
    var result = await sl<SectionsUseCase>().call(params: event.batchYear);
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, sectionsEntity: data))
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
            studentEntity: data?.signInData?.student != null ?
            StudentModel.fromJson(data!.signInData!.student!.toJson()).toEntity() : null
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



}