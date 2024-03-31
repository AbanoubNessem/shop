import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/components/custom_text_button.dart';
import 'package:shop/components/custom_text_form_field.dart';
import 'package:shop/cubit/auth_cubit/auth_cubit.dart';
import 'package:shop/cubit/auth_cubit/auth_state.dart';
import 'package:shop/screens/login_screen/components/login_screen_data.dart';
import 'package:shop/screens/register_screen/components/register_screen_data.dart';
import 'package:shop/utility/app_colores.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<RegisterScreenBody> {
  RegisterScreenData registerScreenData = RegisterScreenData();

  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          if (state.authModel.status!) {
            print(state.authModel.message);
            print(state.authModel.data!.token);
            AuthCubit.get(context)
                .showMessage(state.authModel.message!, Colors.green);
          } else {
            print(state.authModel.message);
            AuthCubit.get(context)
                .showMessage(state.authModel.message!, Colors.red);
          }
        }
        if (state is AuthErrorState) {
          print(state.error);

        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: registerScreenData.registerKey,
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: Text(
                          "REGISTER",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomTextFormField(
                        controller: registerScreenData.nameController,
                        textInputType: TextInputType.name,
                        hint: "Name",
                        validator: "please enter Name",
                        iconPrefix: Icons.person_outline_outlined,
                      ),
                      CustomTextFormField(
                        controller: registerScreenData.phoneController,
                        textInputType: TextInputType.phone,
                        hint: "Phone",
                        validator: "please enter Phone",
                        iconPrefix: Icons.phone_outlined,
                      ),
                      CustomTextFormField(
                        controller: registerScreenData.emailController,
                        textInputType: TextInputType.emailAddress,
                        hint: "Email",
                        validator: "please enter Email",
                        iconPrefix: Icons.email_outlined,
                      ),
                      CustomTextFormField(
                          controller: registerScreenData.passwordController,
                          textInputType: TextInputType.text,
                          hint: "Password",
                          onSubmit: (value) {
                            if (registerScreenData.registerKey.currentState!
                                .validate()) {
                              print("object");
                              cubit.register(
                                  email: registerScreenData.emailController.text,
                                  password: registerScreenData.passwordController.text,
                                  phone: registerScreenData.phoneController.text,
                                  name: registerScreenData.nameController.text,
                                  context: context
                              );
                            }
                          },
                          isPassword: AuthCubit.get(context).isPassword,
                          validator: "please enter password",
                          onSuffix: AuthCubit.get(context).changeObscure,
                          iconPrefix: Icons.lock_outline,
                          iconSuffix: AuthCubit.get(context).iconData),
                      const SizedBox(
                        height: 50,
                      ),
                      ConditionalBuilder(
                          condition: state is! AuthLoadingState,
                          builder: (context) => SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (registerScreenData.registerKey.currentState!
                                          .validate()) {
                                        print("object");
                                        cubit.register(
                                            email: registerScreenData.emailController.text,
                                            password: registerScreenData.passwordController.text,
                                            phone: registerScreenData.phoneController.text,
                                            name: registerScreenData.nameController.text,
                                            context: context
                                        );
                                      }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Theme.of(context).canvasColor),
                                        textStyle:
                                            const MaterialStatePropertyAll(TextStyle(
                                          fontSize: 25,
                                        ))),
                                    child: const Text("Register")),
                              ),
                          fallback: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.secondaryColor,
                                ),
                              )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
