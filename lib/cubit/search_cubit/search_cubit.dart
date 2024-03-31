


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/constants.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/favorites_cubit/favorites_state.dart';
import 'package:shop/cubit/search_cubit/search_state.dart';
import 'package:shop/models/favorites_model/favorites_add_or_delete_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';
import 'package:shop/models/search_model/search_model.dart';
import 'package:shop/services/dio_helper.dart';
import 'package:shop/services/end_points.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of<SearchCubit>(context);

  SearchModel searchModel = SearchModel();

  void search({
    required String search,
    required BuildContext context,
  }){
    emit(GetSearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        data: {
          "text": search,
        },
      token: token,
      lang: "en"
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel.data!.data![0].price);
      emit(GetSearchSuccessState(searchModel: searchModel));
    }).catchError((error){
      print("REGISTER ERROR IS ::: $error");
      emit(GetSearchErrorState(error: error));
    });
  }
  FavoritesAddOrDeleteModel favoritesAddOrDeleteModel =FavoritesAddOrDeleteModel();
  void changeFavorites({int? productId , BuildContext? context}){
    Map<int,bool> favorites = AppLayoutCubit.get(context).favorites ;
    favorites[productId!] = !favorites[productId]! ;
    emit(ChangeFavoriteLoadingState());
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
      print(favoritesAddOrDeleteModel.message);
      emit(ChangeFavoriteSuccessState(favoritesAddOrDeleteModel:favoritesAddOrDeleteModel ));
    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      print("ERROR FROM GET FAVORITES PRODUCT ::: $error");
      emit(ChangeFavoriteErrorState());
    });
  }



}