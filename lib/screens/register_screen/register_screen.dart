
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/auth_cubit/auth_cubit.dart';
import 'package:shop/screens/register_screen/components/register_screen_body.dart';



class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: RegisterScreenBody()
    );
  }
}
