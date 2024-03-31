import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/constants.dart';
import 'package:shop/cubit/Categories_cubit/categories_state.dart';
import 'package:shop/models/categories_items_model/categories_items_model.dart';
import 'package:shop/models/categories_model/categories_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';
import 'package:shop/models/home_model/home_model.dart';
import 'package:shop/routes/app_links.dart';

import 'package:shop/services/dio_helper.dart';
import 'package:shop/services/end_points.dart';

class CategoriesCubit extends Cubit<CategoriesState>{
  CategoriesCubit():super(CategoriesInitialState());

  static CategoriesCubit get(context) => BlocProvider.of<CategoriesCubit>(context);


  CategoriesModel categoriesModel = CategoriesModel();
  CategoriesItemsModel categoriesItemsModel = CategoriesItemsModel();


  void getCategoriesData(){
    emit(GetCategoriesLoadingState());
    DioHelper.getData(url: CATEGORIES,token: token).then((value){
      categoriesModel = CategoriesModel.formJson(value.data);
      emit(GetCategoriesSuccessState(categoriesModel: categoriesModel));
    }).catchError((error){
      print("ERROR FROM GET CATEGORIES DATA ::: $error");
      emit(GetCategoriesErrorState(error: error));
    });
  }
  void getCategoriesItems({required int productId,required BuildContext context}){
    emit(GetItemsCategoriesLoadingState());
    DioHelper.getData(url: "$CATEGORIES/$productId",token: token).then((value){
      categoriesItemsModel = CategoriesItemsModel.fromJson(value.data);
       print(categoriesItemsModel.data!.data![0].name);
      emit(GetItemsCategoriesSuccessState(itemsModel: categoriesItemsModel));
    }).catchError((error){
      print("ERROR FROM GET CATEGORIES ITEMS ::: $error");
      emit(GetItemsCategoriesErrorState(error: error));
    });
  }

}