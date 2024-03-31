import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/Categories_cubit/categories_cubit.dart';
import 'package:shop/cubit/Categories_cubit/categories_state.dart';
import 'package:shop/models/categories_model/categories_data_model.dart';
import 'package:shop/models/categories_model/categories_to_go_model.dart';
import 'package:shop/models/categories_model/category_data_model.dart';
import 'package:shop/screens/categories_items_screen/components/categories_item.dart';
import 'package:shop/utility/app_colores.dart';

class CategoriesItemsScreen extends StatelessWidget {
  const CategoriesItemsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    CategoriesToGoModel categoryDataModel = ModalRoute.of(context)!.settings.arguments as CategoriesToGoModel;
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategoriesItems(productId: categoryDataModel.index, context: context),
      child: BlocConsumer<CategoriesCubit,CategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${categoryDataModel.categoriesDataModel!.name}"),
            ),
            body: ConditionalBuilder(
              condition: state is! GetItemsCategoriesLoadingState,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) => CategoriesItem(productsModel: CategoriesCubit.get(context).categoriesItemsModel.data!.data![index]),
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 5,
                  ),
                  itemCount:2
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            // body: Center(child: Text("${categoryDataModel.index}"),),
          );
        },
      ),
    );
  }
}
