import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/models/home_model/products_model.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/utility/app_colores.dart';

class ProductItem extends StatelessWidget {
  ProductsModel productsModel;

  ProductItem({super.key, required this.productsModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit,AppLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(3),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, ScreensNames.product,arguments: productsModel);
            },
            child: Column(
              children: [
                Stack(alignment: Alignment.bottomLeft, children: [
                  Image(
                    image: NetworkImage(productsModel.image),
                    width: double.infinity,
                    height: 200,
                  ),
                  if (productsModel.discount != 0)
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(color: AppColors.redColor,borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Text(
                        "Discount",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                ]),
                const SizedBox(height: 5,),
                Text(
                  productsModel.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      "${productsModel.price.round()} EGP",
                      style: const TextStyle(color: AppColors.secondaryColor,fontSize: 12),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (productsModel.discount != 0)
                      Text(
                        "${productsModel.oldPrice.round()} EGP",
                        style: const TextStyle(decoration: TextDecoration.lineThrough,fontSize: 10),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
