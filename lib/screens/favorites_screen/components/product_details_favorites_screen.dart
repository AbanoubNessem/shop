import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/models/favorites_model/favorites_model/Favorites_product.dart';
import 'package:shop/models/home_model/products_model.dart';
import 'package:shop/utility/app_colores.dart';

class ProductDetailsFavoritesScreen extends StatelessWidget {
  const ProductDetailsFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return BlocConsumer<AppLayoutCubit,AppLayoutStates>(
      listener: (context, state) {
        if (state is ChangeCartsSuccessState) {
          if (state.addAddDeleteCartModel.status!) {
            print(state.addAddDeleteCartModel.message);
            AppLayoutCubit.get(context).showMessage(
                state.addAddDeleteCartModel.message!, Colors.green);
          } else {
            print(state.addAddDeleteCartModel.message);
            AppLayoutCubit.get(context)
                .showMessage(state.addAddDeleteCartModel.message!, Colors.red);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Product"),),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: Alignment.bottomLeft, children: [
                    Image(
                      image: NetworkImage(product.image!),
                      width: double.infinity,
                      height: 250,
                    ),
                    if (product.discount != 0)
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
                    product.name!,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "${product.price!.round()} EGP",
                        style: const TextStyle(color: AppColors.secondaryColor,fontSize: 14),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (product.discount != 0)
                        Text(
                          "${product.oldPrice!.round()} EGP",
                          style: const TextStyle(decoration: TextDecoration.lineThrough,fontSize: 10),
                        ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: AppLayoutCubit.get(context).favorites[product.id]!?AppColors.redColor:Colors.white,
                        child: IconButton(
                            onPressed: (){
                              print("fav ${product.id}");
                              AppLayoutCubit.get(context).changeFavorites(productId: product.id!);
                            },
                            icon:  Icon(
                              Icons.favorite_border_outlined,
                              color: AppLayoutCubit.get(context).favorites[product.id]!?Colors.white:Colors.black,
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    "Details :",
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    product.description!,
                    style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5,),
                  ConditionalBuilder(
                      condition: state is! ChangeCartsLoadingState,
                      builder:(context) => Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                              AppLayoutCubit.get(context).changeCarts(productId: product.id!);
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Theme.of(context).canvasColor),
                                textStyle: MaterialStatePropertyAll(
                                    TextStyle(
                                      fontSize: 25,
                                    )
                                )
                            ),
                            child: Text("Add To Cart")
                        ),
                      ),
                      fallback: (context) => Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,),)
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
