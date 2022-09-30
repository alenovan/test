part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}


class AuthLoadedState extends AuthState {
  RegisterResponse response;

  AuthLoadedState({required this.response});

  @override
  // TODO: implement props
  List<Object> get props => [response];
}

class AuthErrorState extends AuthState {
  String message;

  AuthErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
