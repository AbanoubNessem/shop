import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/settings_cubit/settings_cubit.dart';
import 'package:shop/cubit/settings_cubit/settings_state.dart';
import 'package:shop/screens/settings_screen/components/setting_form.dart';
import 'package:shop/utility/app_colores.dart';

class SettingsBodyScreen extends StatelessWidget {
  const SettingsBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit,SettingsStates>(
         listener: (context, state) {
           if (state is UpDateSuccessState) {
             if (state.authModel.status!) {
               print(state.authModel.message);
               SettingsCubit.get(context)
                   .showMessage(state.authModel.message!, Colors.green);
             } else {
               print(state.authModel.message);
               SettingsCubit.get(context)
                   .showMessage(state.authModel.message!, Colors.red);
             }
           }
         },
        builder: (context, state) {
          return ConditionalBuilder(
              condition: SettingsCubit.get(context).userModel.data != null,
              builder: (context) =>  SettingsForm(userModel:SettingsCubit.get(context).userModel.data!),
              fallback: (context) => const Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,),),
          );
        },
    );
  }
}
