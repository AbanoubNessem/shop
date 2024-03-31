import 'package:shop/models/categories_items_model/categories_items_model.dart';
import 'package:shop/models/categories_model/categories_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';

abstract class CategoriesState {}
class CategoriesInitialState extends CategoriesState {}

class GetCategoriesLoadingState extends CategoriesState {}
class GetCategoriesSuccessState extends CategoriesState {

  final CategoriesModel categoriesModel ;
  GetCategoriesSuccessState({required this.categoriesModel});
}
class GetCategoriesErrorState extends CategoriesState {
  var error ;
  GetCategoriesErrorState({required this.error});
}
class GetItemsCategoriesLoadingState extends CategoriesState {}
class GetItemsCategoriesSuccessState extends CategoriesState {

  final CategoriesItemsModel itemsModel ;
  GetItemsCategoriesSuccessState({required this.itemsModel});
}
class GetItemsCategoriesErrorState extends CategoriesState {
  var error ;
  GetItemsCategoriesErrorState({required this.error});
}