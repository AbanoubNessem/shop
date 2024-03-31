

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/screens/home_screen/components/Products_body_screen.dart';
import 'package:shop/utility/app_colores.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit,AppLayoutStates>(
      listener:(context, state) {
        if(state is ChangeFavoritesSuccessState){
         if(!state.favoritesAddOrDeleteModel.status!){
           AppLayoutCubit.get(context).showMessage(state.favoritesAddOrDeleteModel.message!,Colors.green);
         }
        }
      },
        builder:(context, state) {
          return ConditionalBuilder(
              condition: AppLayoutCubit.get(context).homeModel.data != null ,
              builder: (context) => ProductsBodyScreen(homeModel:AppLayoutCubit.get(context).homeModel,),
              fallback: (context) =>const Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,),) ,
          );
        },
    );
  }
}
