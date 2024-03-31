import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/components/constants.dart';
import 'package:shop/cubit/auth_cubit/auth_state.dart';
import 'package:shop/models/auth_model/auth_model.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/services/cache_helper.dart';
import 'package:shop/services/dio_helper.dart';
import 'package:shop/services/end_points.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  bool isPassword = true;
  IconData iconData = Icons.visibility_outlined;
  AuthModel authModel = AuthModel();

  void changeObscure() {
    isPassword = !isPassword;
    if (isPassword == true) {
      iconData = Icons.visibility_outlined;
    } else {
      iconData = Icons.visibility_off_outlined;
    }
    print(isPassword);
    emit(ChangeObscureState());
  }

  Future<bool?> showMessage(String message, Color color) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(AuthLoadingState());
    DioHelper.postData(url: LOGIN, data: {"email": email, "password": password})
        .then((value) {
      authModel = AuthModel.formJson(value.data);
      CacheHelper.saveData(key: "token", value: "${authModel.data!.token}");
      token = authModel.data!.token;
      Navigator.pushReplacementNamed(context, ScreensNames.appLayout);
      emit(AuthSuccessState(authModel: authModel));
    }).catchError((error) {
      print("LOGIN ERROR IS ::: $error");
      emit(AuthErrorState(error: error));
    });
  }
  void register({
    required String email,
    required String password,
    required String phone,
    required String name,
    required BuildContext context,
  }){
    emit(AuthLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        }
    ).then((value) {
      authModel = AuthModel.formJson(value.data);
      CacheHelper.saveData(key: "token", value: "${authModel.data!.token}");
      token = authModel.data!.token;
      Navigator.pushReplacementNamed(context, ScreensNames.appLayout);
      emit(AuthSuccessState(authModel: authModel));

    }).catchError((error){
      print("REGISTER ERROR IS ::: $error");
      emit(AuthErrorState(error: error));
    });
  }
}
