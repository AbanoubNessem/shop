import 'package:flutter/cupertino.dart';

class LoginScreenData{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginKey = GlobalKey<FormState>();
  clearFields(){
    emailController.text = "";
    passwordController.text = "";
  }
}