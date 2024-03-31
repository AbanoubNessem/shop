import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/Categories_cubit/categories_cubit.dart';
import 'package:shop/cubit/Categories_cubit/categories_state.dart';
import 'package:shop/models/categories_model/categories_to_go_model.dart';
import 'package:shop/models/categories_model/category_data_model.dart';
import 'package:shop/routes/app_links.dart';

class CategoriesBody extends StatelessWidget {
  CategoryDataModel categoryDataModel;
   CategoriesBody({super.key,required this.categoryDataModel });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit,CategoriesState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: InkWell(
            onTap: () {
              print("${categoryDataModel.id}");
              // CategoriesCubit.get(context).getCategoriesItems(productId: categoryDataModel.id!,context: context);
              Navigator.pushNamed(context, ScreensNames.categoriesItems,arguments: CategoriesToGoModel(categoriesDataModel: categoryDataModel, index:categoryDataModel.id! ));
            },
            child: Row(
              children: [
                Image(
                  image:NetworkImage("${categoryDataModel.image}"),
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 20,)
                ,Text(
                  "${categoryDataModel.name}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Theme.of(context).canvasColor,)
              ],
            ),
          ),
        );
      },
    );
  }
}