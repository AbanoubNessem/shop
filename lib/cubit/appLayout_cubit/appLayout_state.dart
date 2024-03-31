import 'package:shop/models/carts_model/add_and_delete_cart_model.dart';
import 'package:shop/models/carts_model/carts_model.dart';
import 'package:shop/models/categories_model/categories_model.dart';
import 'package:shop/models/favorites_model/favorites_add_or_delete_model.dart';
import 'package:shop/models/home_model/home_model.dart';

abstract class AppLayoutStates{}
class HomeInitialState extends AppLayoutStates {}

class ChangeThemeModeSuccessState extends AppLayoutStates{
  bool isDark;

  ChangeThemeModeSuccessState({required this.isDark});
}
class ChangeCurrentIndexState extends AppLayoutStates{
  int index;
  ChangeCurrentIndexState({required this.index});
}
class GetDataLoadingState extends AppLayoutStates {}
class GetDataSuccessState extends AppLayoutStates {
  // Map<String,dynamic> data ;
  // AuthSuccessState({required this.data});
  final HomeModel homeModel ;
  GetDataSuccessState({required this.homeModel});
}
class GetDataErrorState extends AppLayoutStates {
  var error ;
  GetDataErrorState({required this.error});
}

class GetCartsLoadingState extends AppLayoutStates {}
class GetCartsSuccessState extends AppLayoutStates {
  // Map<String,dynamic> data ;
  // AuthSuccessState({required this.data});
  final CartsModel cartsModel ;
  GetCartsSuccessState({required this.cartsModel});
}
class GetCartsErrorState extends AppLayoutStates {
  var error ;
  GetCartsErrorState({required this.error});
}

class ChangeFavoritesLoadingState extends AppLayoutStates{}
class ChangeFavoritesSuccessState extends AppLayoutStates{
  FavoritesAddOrDeleteModel favoritesAddOrDeleteModel;

  ChangeFavoritesSuccessState({required this.favoritesAddOrDeleteModel});
}
class ChangeFavoritesErrorState extends AppLayoutStates{}

class ChangeCartsLoadingState extends AppLayoutStates{}
class ChangeCartsSuccessState extends AppLayoutStates{
  AddAddDeleteCartModel addAddDeleteCartModel;

  ChangeCartsSuccessState({required this.addAddDeleteCartModel});
}
class ChangeCartsErrorState extends AppLayoutStates{}


// class GetCategoriesLoadingState extends AppLayoutStates {}
// class GetCategoriesSuccessState extends AppLayoutStates {
//
//   final CategoriesModel categoriesModel ;
//   GetCategoriesSuccessState({required this.categoriesModel});
// }
// class GetCategoriesErrorState extends AppLayoutStates {
//   var error ;
//   GetCategoriesErrorState({required this.error});
// }