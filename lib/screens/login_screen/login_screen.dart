import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/custom_text_form_field.dart';
import 'package:shop/cubit/auth_cubit/auth_cubit.dart';
import 'package:shop/screens/login_screen/components/login_screen_body.dart';
import 'package:shop/utility/app_colores.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
        child: LoginScreenBody()
    );
  }
}
