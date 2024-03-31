import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/favorites/favorites_item.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:shop/cubit/favorites_cubit/favorites_state.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';
import 'package:shop/screens/cart_screen/components/carts_item.dart';
import 'package:shop/utility/app_colores.dart';

class CartsBodyScreen extends StatelessWidget {
  CartsBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetCartsLoadingState,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => CartsItem(cartItemModel: AppLayoutCubit.get(context).cartsModel.data!.cartItems[index]),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 5,
              ),
              itemCount: AppLayoutCubit.get(context).cartsModel.data!.cartItems.length
          ),
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
