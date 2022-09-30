part of 'user_bloc.dart';

abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class UserLoadingLoadMoreState extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}


class UserLoadedState extends UserState {
  UserListResponse response;

  UserLoadedState({required this.response});

  @override
  // TODO: implement props
  List<Object> get props => [response];
}

class UserErrorState extends UserState {
  String message;

  UserErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
