part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class RegisterAct extends AuthEvent {
  RegisterPayload data;

  RegisterAct({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
