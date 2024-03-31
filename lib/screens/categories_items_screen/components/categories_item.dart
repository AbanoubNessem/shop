import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:shop/models/favorites_model/favorites_model/Favorites_product.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_data_data_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';
import 'package:shop/models/home_model/products_model.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/utility/app_colores.dart';

class CategoriesItem extends StatelessWidget {
  ProductsModel productsModel;

  CategoriesItem({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit,AppLayoutStates>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, ScreensNames.product,arguments: productsModel);
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              height: 120,
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image(
                        image: NetworkImage("${productsModel.image}"),
                        height: 90,
                        width: 90,
                        fit: BoxFit.contain,
                      ),
                      if (productsModel.discount != 0)
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
                          "${productsModel.name}",
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
                              "${productsModel.price.round()} EGP",
                              style: const TextStyle(
                                  color: AppColors.secondaryColor, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (productsModel.discount != 0)
                              Text(
                                "${productsModel.oldPrice.round()} EGP",
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 10),
                              ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: AppLayoutCubit.get(context).favorites[productsModel.id]!?AppColors.redColor:Colors.white,
                              child: IconButton(
                                  onPressed: (){
                                    print("fav ${productsModel.id}");
                                    AppLayoutCubit.get(context).changeFavorites(productId: productsModel.id);
                                  },
                                  icon:  Icon(
                                    Icons.favorite_border_outlined,
                                    color: AppLayoutCubit.get(context).favorites[productsModel.id]!?Colors.white:Colors.black,
                                  )
                              ),
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
        listener: (context, state) {},
    );
  }
}
