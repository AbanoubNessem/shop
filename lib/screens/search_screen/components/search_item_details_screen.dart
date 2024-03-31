import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/models/favorites_model/favorites_model/Favorites_product.dart';
import 'package:shop/models/home_model/products_model.dart';
import 'package:shop/models/search_model/search_product.dart';
import 'package:shop/utility/app_colores.dart';

class SearchItemDetailsScreen extends StatelessWidget {
  const SearchItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchProduct searchProduct = ModalRoute.of(context)!.settings.arguments as SearchProduct;
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
                      image: NetworkImage(searchProduct.image!),
                      width: double.infinity,
                      height: 250,
                    ),

                  ]),
                  const SizedBox(height: 5,),
                  Text(
                    searchProduct.name!,
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "${searchProduct.price!.round()} EGP",
                        style: const TextStyle(color: AppColors.secondaryColor,fontSize: 14),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: AppLayoutCubit.get(context).favorites[searchProduct.id]!?AppColors.redColor:Colors.white,
                        child: IconButton(
                            onPressed: (){
                              print("fav ${searchProduct.id}");
                              AppLayoutCubit.get(context).changeFavorites(productId: searchProduct.id!);
                            },
                            icon:  Icon(
                              Icons.favorite_border_outlined,
                              color: AppLayoutCubit.get(context).favorites[searchProduct.id]!?Colors.white:Colors.black,
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
                    searchProduct.description!,
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
                              AppLayoutCubit.get(context).changeCarts(productId: searchProduct.id!);
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
