import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/Categories_cubit/categories_cubit.dart';
import 'package:shop/cubit/Categories_cubit/categories_state.dart';
import 'package:shop/models/categories_model/categories_to_go_model.dart';
import 'package:shop/models/categories_model/category_data_model.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/utility/app_colores.dart';

class CategoriesItem extends StatelessWidget {
  CategoryDataModel categoryDataModel;
  CategoriesItem({super.key,required this.categoryDataModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesCubit(),
      child: BlocConsumer<CategoriesCubit,CategoriesState>(
        listener: (context, state) {

        },
          builder: (context, state) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, ScreensNames.categoriesItems,arguments: CategoriesToGoModel(categoriesDataModel: categoryDataModel, index:categoryDataModel.id! ));
              },
              child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image(
                      image: NetworkImage("${categoryDataModel.image}"),
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      width: 100,
                      color: AppColors.blackColor.withOpacity(0.8),
                      child:  Text(
                        "${categoryDataModel.name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            );
          },

      ),
    );
  }
}
