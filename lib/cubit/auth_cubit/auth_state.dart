import 'package:shop/models/auth_model/auth_model.dart';

abstract class AuthState {}
class AuthInitialState extends AuthState {}

class ChangeObscureState extends AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {
  final AuthModel authModel ;
  AuthSuccessState({required this.authModel});
}
class AuthErrorState extends AuthState {
  var error ;
  AuthErrorState({required this.error});
}