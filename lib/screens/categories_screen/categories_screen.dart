import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/Categories_cubit/categories_cubit.dart';
import 'package:shop/cubit/Categories_cubit/categories_state.dart';
import 'package:shop/screens/categories_screen/components/categories_screen_body.dart';
import 'package:shop/utility/app_colores.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategoriesData(),
      child: BlocConsumer<CategoriesCubit,CategoriesState>(
           listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                condition: CategoriesCubit.get(context).categoriesModel.data != null,
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) => CategoriesBody(categoryDataModel: CategoriesCubit.get(context).categoriesModel.data!.data![index]),
                    separatorBuilder: (context, index) => Container(width: double.infinity,height: 5,),
                    itemCount: CategoriesCubit.get(context).categoriesModel.data!.data!.length
                ),
                fallback: (context) => Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,),),

              );
            },
      ),
    );
  }
}
