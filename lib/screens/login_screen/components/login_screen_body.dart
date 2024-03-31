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
import 'package:shop/routes/app_links.dart';
import 'package:shop/screens/login_screen/components/login_screen_data.dart';
import 'package:shop/utility/app_colores.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  LoginScreenData loginScreenData = LoginScreenData();
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is AuthSuccessState){
          if(state.authModel.status!){
            print(state.authModel.message);
            print(state.authModel.data!.token);
            AuthCubit.get(context).showMessage(state.authModel.message!,Colors.green);
          }else{
            print(state.authModel.message);
            AuthCubit.get(context).showMessage(state.authModel.message!,Colors.red);

          }
        }
        if(state is AuthErrorState){
          print(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: loginScreenData.loginKey,
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                        child: Text("LOGIN",style: Theme.of(context).textTheme.titleLarge,),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                      CustomTextFormField(
                        controller: loginScreenData.emailController,
                        hint: "Email",
                        validator:  "please enter Email",
                        iconPrefix: Icons.email_outlined,
                      ),
                      CustomTextFormField(
                          controller: loginScreenData.passwordController,
                          hint: "Password",
                          onSubmit: (value) {
                            if(loginScreenData.loginKey.currentState!.validate()){
                              print("object");
                              cubit.login(
                                context: context,
                                  email: loginScreenData.emailController.text,
                                  password: loginScreenData.passwordController.text
                              );
                            }
                          },
                          isPassword: AuthCubit.get(context).isPassword,
                          validator:  "please enter password",
            
                          
                          onSuffix: AuthCubit.get(context).changeObscure,
                          iconPrefix: Icons.lock_outline,
                          iconSuffix:AuthCubit.get(context).iconData
                      ),
                      SizedBox(
                        height: 50,
                      ),
                     ConditionalBuilder(
                         condition: state is! AuthLoadingState,
                         builder:(context) => Container(
                           width: double.infinity,
                           child: ElevatedButton(
                               onPressed: (){
                                 if(loginScreenData.loginKey.currentState!.validate()){
                                   print("object");
                                   cubit.login(
                                     context: context,
                                       email: loginScreenData.emailController.text,
                                       password: loginScreenData.passwordController.text
                                   );
                                 }
            
                               },
                               style: ButtonStyle(
                                   backgroundColor: MaterialStatePropertyAll(Theme.of(context).canvasColor),
                                   textStyle: MaterialStatePropertyAll(
                                       TextStyle(
                                         fontSize: 25,
                                       )
                                   )
                               ),
                               child: Text("Login")
                           ),
                         ),
                         fallback: (context) => Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,),)
                     ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          SizedBox(width: 20,),
                          Text("don't have an account ?",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),),
                          CustomTextButton(
                              label: "Sign up",
                              onPressed: (){
                                print("don't have an account ?");
                                Navigator.pushNamed(context, ScreensNames.register);

                              }
                          ),
                        ],
                      )
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
