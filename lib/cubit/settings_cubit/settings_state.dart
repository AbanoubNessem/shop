import 'package:shop/models/auth_model/auth_model.dart';

abstract class SettingsStates {}
class SettingsInitialState extends SettingsStates {}

class GetProfileLoadingState extends SettingsStates {}
class GetProfileSuccessState extends SettingsStates {

  final AuthModel userModel ;
  GetProfileSuccessState({required this.userModel});
}
class GetProfileErrorState extends SettingsStates {
  var error ;
  GetProfileErrorState({required this.error});
}
class UpDateLoadingState extends SettingsStates {}
class UpDateSuccessState extends SettingsStates {
  final AuthModel authModel ;
  UpDateSuccessState({required this.authModel});
}
class UpDateErrorState extends SettingsStates {
  var error ;
  UpDateErrorState({required this.error});
}