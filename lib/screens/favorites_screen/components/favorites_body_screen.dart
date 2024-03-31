import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/favorites/favorites_item.dart';
import 'package:shop/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:shop/cubit/favorites_cubit/favorites_state.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';
import 'package:shop/utility/app_colores.dart';

class FavoritesBodyScreen extends StatelessWidget {
  FavoritesBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetFavoritesLoadingState,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => FavoritesItem(
                      favoritesModel: FavoritesCubit.get(context)
                          .favoritesModel
                          .data!
                          .data![index]),
              separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 5,
                  ),
              itemCount: FavoritesCubit.get(context)
                  .favoritesModel
                  .data!
                  .data!
                  .length),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ),
          ),
        );
      },
    );
  }
}
