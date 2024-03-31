import 'package:flutter/material.dart';

class RegisterScreenData{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var registerKey = GlobalKey<FormState>();
  clearFields(){
    emailController.text = "";
    passwordController.text = "";
    nameController.text = "";
    phoneController.text = "";
  }
}