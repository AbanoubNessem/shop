


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/constants.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/favorites_cubit/favorites_state.dart';
import 'package:shop/models/favorites_model/favorites_add_or_delete_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';
import 'package:shop/services/dio_helper.dart';
import 'package:shop/services/end_points.dart';

class FavoritesCubit extends Cubit<FavoritesStates>{
  FavoritesCubit():super(FavoritesInitialState());

  static FavoritesCubit get(context) => BlocProvider.of<FavoritesCubit>(context);


  FavoritesAddOrDeleteModel favoritesAddOrDeleteModel = FavoritesAddOrDeleteModel();
  FavoritesModel favoritesModel = FavoritesModel();

  void getFavoritesData(){
    emit(GetFavoritesLoadingState());
    DioHelper.getData(url: FAVORITES,token: token).then((value){
      favoritesModel = FavoritesModel.fromJson(value.data);
      print(favoritesModel.data!.data![0].product!.name);
      emit(GetFavoritesSuccessState(favoritesModel: favoritesModel));
    }).catchError((error){
      print("ERROR FROM GET FAVORITES DATA ::: $error");
      emit(GetFavoritesErrorState(error: error));
    });
  }

  void changeFavorites({int? productId , BuildContext? context}){
    Map<int,bool> favorites = AppLayoutCubit.get(context).favorites ;
    favorites[productId!] = !favorites[productId]! ;
    emit(ChangeFavoritesLoadingState());
    DioHelper.postData(
        url: FAVORITES,
        lang: "en",
        token: token,
        data: {
          "product_id":productId
        }
    ).then((value){
      favoritesAddOrDeleteModel = FavoritesAddOrDeleteModel.fromJson(value.data);
      if(!favoritesAddOrDeleteModel.status!){
        favorites[productId] = !favorites[productId]!;
      }
      getFavoritesData();

      print(favoritesAddOrDeleteModel.message);
      emit(ChangeFavoritesSuccessState(favoritesAddOrDeleteModel:favoritesAddOrDeleteModel ));
    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      print("ERROR FROM GET FAVORITES PRODUCT ::: $error");
      emit(ChangeFavoritesErrorState());
    });
  }

}