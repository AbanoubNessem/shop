

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:shop/cubit/favorites_cubit/favorites_state.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';
import 'package:shop/screens/favorites_screen/components/favorites_body_screen.dart';
import 'package:shop/utility/app_colores.dart';

class FavoritesScreen extends StatelessWidget {


 const FavoritesScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit()..getFavoritesData(),
      child: FavoritesBodyScreen(),
    );
  }
}
