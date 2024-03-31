import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:shop/models/carts_model/cart_item_model.dart';
import 'package:shop/models/carts_model/carts_data_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_data_data_model.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/utility/app_colores.dart';

class CartsItem extends StatelessWidget {
  CartItemModel cartItemModel ;

  CartsItem({super.key, required this.cartItemModel});

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
              // Navigator.pushNamed(context, ScreensNames.favoritesItems,arguments: favoritesModel.product);
            },
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image(
                      image: NetworkImage("${cartItemModel.cartProduct.image}"),
                      height: 90,
                      width: 90,
                      fit: BoxFit.contain,
                    ),
                    if (cartItemModel.cartProduct.discount != 0)
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
                        "${cartItemModel.cartProduct.name}",
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
                            "${cartItemModel.cartProduct.price!.round()} EGP",
                            style: const TextStyle(
                                color: AppColors.secondaryColor, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          if (cartItemModel.cartProduct.discount != 0)
                            Text(
                              "${cartItemModel.cartProduct.oldPrice!.round()} EGP",
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 10),
                            ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor:  AppLayoutCubit.get(context).favorites[cartItemModel.cartProduct.id]!?AppColors.redColor:Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  AppLayoutCubit.get(context).changeFavorites(productId: cartItemModel.cartProduct.id);
                                  print("fav ${cartItemModel.cartProduct.id}");
                                },
                                icon:  Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppLayoutCubit.get(context).favorites[cartItemModel.cartProduct.id]!?Colors.white:Colors.black,
                                )),
                          ),
                          SizedBox(width: 5,),
                          IconButton(
                              onPressed: () {
                                AppLayoutCubit.get(context).changeCarts(productId: cartItemModel.cartProduct.id);
                                AppLayoutCubit.get(context).getCartsData();
                                print("fav ${cartItemModel.cartProduct.id}");
                              },
                              icon:  Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.black,
                              ))
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
