import 'dart:async';

import 'package:bdn_test/service/models/auth/RegisterPayload.dart';
import 'package:bdn_test/service/models/auth/RegisterResponse.dart';
import 'package:bdn_test/service/repository/AuthRepository.dart';
import 'package:bdn_test/utils/SharedPreference.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository;
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit)async {
      if (event is RegisterAct) {
        emit(AuthLoadingState());
        try {
          final response = await repository.register(event.data);
          debugPrint(response.token);
          await addStringSf("token", response.token);
          emit(AuthLoadedState(response: response));
        } catch (e) {
          emit(AuthErrorState(message: e.toString()));
        }
      }
    });
  }
}
