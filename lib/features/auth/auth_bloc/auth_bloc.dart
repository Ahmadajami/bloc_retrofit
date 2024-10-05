

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_shop/models/forms/sign_in/sign_in_form.dart';
import 'package:quotes_shop/models/user/user_model.dart';
import 'package:quotes_shop/services/auth_services/auth_service.dart';
import 'package:quotes_shop/services/storage_service/storage_service.dart';
import 'package:quotes_shop/utils/constants/storage_constant.dart';


part 'auth_event.dart';
part 'auth_state.dart';
/*
*

      * */

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final StorageService _storageService;
  AuthBloc({required AuthService authService,required StorageService storageService}) :_storageService=storageService,_authService=authService, super(AuthInitial()) {
    on<AuthLoginRequested>(_login);
    on<AuthStorageRequested>(_storageCheck);
  }

  Future<void> _login(AuthLoginRequested event,Emitter<AuthState> emit )
  async{
    emit(AuthLoading());
    final String username=event.username;
    final String password=event.password;
    final SignInForm form =SignInForm(
        username: username,password: password,expiresInMins: 30
    );

    try{
      final UserModel userModel=await _authService.login(form);
      final jsonString =jsonEncode(userModel);
      await _storageService.storeString(StorageConstants.userDataKey,jsonString);
      return emit(AuthSuccess(userModel: userModel));
    } on DioException catch (error){
      log("catched");
     return  emit(AuthFailure('Got error : ${error.response!.statusCode} -> ${error.response!.statusMessage}'));
    }


  }
  Future<void> _storageCheck(AuthStorageRequested event,Emitter<AuthState> emit)
  async {
    final userModelJSON=  await _storageService.getString(StorageConstants.userDataKey);
    if(userModelJSON == null)
    {
      return emit(AuthInitial());
    }
    final UserModel userModel= UserModel.fromJson(jsonDecode(userModelJSON));
    return emit(AuthSuccess(userModel: userModel));

  }
}
