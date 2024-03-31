
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/components/constants.dart';
import 'package:shop/cubit/settings_cubit/settings_state.dart';
import 'package:shop/models/auth_model/auth_model.dart';
import 'package:shop/models/auth_model/auth_user_model.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/services/cache_helper.dart';

import 'package:shop/services/dio_helper.dart';
import 'package:shop/services/end_points.dart';

class SettingsCubit extends Cubit<SettingsStates>{
  SettingsCubit():super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);

  AuthModel userModel = AuthModel();

  void getProfileData(){
    emit(GetProfileLoadingState());
    DioHelper.getData(url: PROFILE,token: token).then((value){
      userModel = AuthModel.formJson(value.data);
      emit(GetProfileSuccessState(userModel: userModel));
    }).catchError((error){
      print("ERROR FROM GET PROFILE DATA ::: $error");
      emit(GetProfileErrorState(error: error));
    });
  }

  void updateData({
    required String name,
    required String email,
    required String phone,
    required BuildContext context
}){
    emit(UpDateLoadingState());
    DioHelper.putData(
        url: UPDATE,
        data: {
          "name": name,
          "email": email,
          "phone": phone,
        },
      lang: "en",
      token: token
    ).then((value) {
      userModel = AuthModel.formJson(value.data);
      print(userModel.data!.name);
      emit(UpDateSuccessState(authModel: userModel));
    }).catchError((error){
      print("REGISTER ERROR IS ::: $error");
      emit(UpDateErrorState(error: error));
    });
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

}