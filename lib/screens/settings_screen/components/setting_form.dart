import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/custom_text_form_field.dart';
import 'package:shop/cubit/settings_cubit/settings_cubit.dart';
import 'package:shop/cubit/settings_cubit/settings_state.dart';
import 'package:shop/models/auth_model/auth_user_model.dart';

import 'package:shop/screens/settings_screen/components/setting_data.dart';
import 'package:shop/utility/app_colores.dart';

class SettingsForm extends StatelessWidget {

  UserModel userModel;
  SettingsForm({super.key,required this.userModel});

  SettingData settingData = SettingData();

  @override
  Widget build(BuildContext context) {
    settingData.nameController.text = userModel.name!;
    settingData.emailController.text = userModel.email!;
    settingData.phoneController.text = userModel.phone!;
    return BlocConsumer<SettingsCubit,SettingsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: settingData.settingKey,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  if(state is UpDateLoadingState)
                    LinearProgressIndicator(color: AppColors.secondaryColor,),
                  CustomTextFormField(
                      controller: settingData.nameController,
                      hint: "Name",
                      validator: "not valid",
                      iconPrefix: Icons.person_outline_outlined
                  ),
                  const SizedBox(height: 8,),
                  CustomTextFormField(
                      controller: settingData.emailController,
                      textInputType: TextInputType.emailAddress,
                      hint: "Name",
                      validator: "not valid",
                      iconPrefix: Icons.email_outlined
                  ),
                  const SizedBox(height: 8,),
                  CustomTextFormField(
                      controller: settingData.phoneController,
                      textInputType: TextInputType.phone,
                      hint: "Name",
                      validator: "not valid",
                      iconPrefix: Icons.phone_outlined
                  ),
                  const SizedBox(height: 8,),
                  ConditionalBuilder(
                      condition: true,
                      builder:(context) => Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                              if(settingData.settingKey.currentState!.validate()){
                                print("update");
                                SettingsCubit.get(context).updateData(
                                    name:settingData.nameController.text,
                                    email: settingData.emailController.text,
                                    phone: settingData.phoneController.text,
                                    context: context);
                              }

                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Theme.of(context).canvasColor),
                                textStyle: const MaterialStatePropertyAll(
                                    TextStyle(
                                      fontSize: 25,
                                    )
                                )
                            ),
                            child: const Text("Update")
                        ),
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,),)
                  ),
                ],
              ),
            )
        );
      },

    );
  }
}
