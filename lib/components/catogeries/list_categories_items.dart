import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/catogeries/categories_item.dart';
import 'package:shop/cubit/Categories_cubit/categories_cubit.dart';
import 'package:shop/cubit/Categories_cubit/categories_state.dart';
import 'package:shop/utility/app_colores.dart';

class ListCategoriesItems extends StatelessWidget {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategoriesData(),
      child: BlocConsumer<CategoriesCubit,CategoriesState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! GetCategoriesLoadingState,
            builder: (context) => SizedBox(
              height: 100,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoriesItem(categoryDataModel:CategoriesCubit.get(context).categoriesModel.data!.data![index],),
                  separatorBuilder: (context, index) => const SizedBox(width: 20,),
                  itemCount:CategoriesCubit.get(context).categoriesModel.data!.data!.length),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,),),
          );
        },
      ),
    );
  }
}
