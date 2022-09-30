import 'dart:async';

import 'package:bdn_test/service/models/user/UserListResponse.dart';
import 'package:bdn_test/service/repository/UserRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  int page = 1;
  bool isFetching = false;
  UserRepository repository;

  UserBloc({required this.repository}) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is getListUser) {
        if (page <= 1) {
          emit(UserLoadingState());
        } else {
          emit(UserLoadingLoadMoreState());
        }
        try {
          final response = await repository.listUser(page);
          emit(UserLoadedState(response: response));
        } catch (e) {
          emit(UserErrorState(message: e.toString()));
        }
      }
    });
  }
}
