import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_data_data_model.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/utility/app_colores.dart';

class FavoritesItem extends StatelessWidget {
  FavoritesDataDataModel favoritesModel;

  FavoritesItem({super.key, required this.favoritesModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit,AppLayoutStates>(
      listener: (context, state) {

      },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            height: 120,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ScreensNames.favoritesItems,arguments: favoritesModel.product);
              },
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image(
                        image: NetworkImage("${favoritesModel.product!.image}"),
                        height: 90,
                        width: 90,
                        fit: BoxFit.contain,
                      ),
                      if (favoritesModel.product!.discount != 0)
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: const Text(
                            "Discount",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${favoritesModel.product!.name}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "${favoritesModel.product!.price!.round()} EGP",
                              style: const TextStyle(
                                  color: AppColors.secondaryColor, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (favoritesModel.product!.discount != 0)
                              Text(
                                "${favoritesModel.product!.oldPrice!.round()} EGP",
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 10),
                              ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: AppColors.redColor,
                              child: IconButton(
                                  onPressed: () {
                                    FavoritesCubit.get(context).changeFavorites(productId: favoritesModel.product!.id,context: context);
                                    print("fav ${favoritesModel.product!.id}");
                                  },
                                  icon: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}
