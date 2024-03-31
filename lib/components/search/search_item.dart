
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/cubit/search_cubit/search_cubit.dart';
import 'package:shop/models/search_model/search_product.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/utility/app_colores.dart';

class SearchItem extends StatelessWidget {
  SearchProduct searchProduct;

  SearchItem({super.key, required this.searchProduct});

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
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: 120,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, ScreensNames.searchItems,arguments: searchProduct);
            },
            child: Row(
              children: [
                Image(
                  image: NetworkImage("${searchProduct.image}"),
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "${searchProduct.name}",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            "${searchProduct.price!.round()} EGP",
                            style: const TextStyle(
                                color: AppColors.secondaryColor, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: AppLayoutCubit.get(context).favorites[searchProduct.id]!?AppColors.redColor:Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  SearchCubit.get(context).changeFavorites(
                                      productId: searchProduct.id, context: context);
                                  print("fav ${searchProduct.id}");
                                },
                                icon:  Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppLayoutCubit.get(context).favorites[searchProduct.id]!?Colors.white:Colors.black,
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
