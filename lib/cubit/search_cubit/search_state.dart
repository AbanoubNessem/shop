import 'package:shop/models/favorites_model/favorites_add_or_delete_model.dart';
import 'package:shop/models/search_model/search_model.dart';

abstract class SearchStates {}
class SearchInitialState extends SearchStates {}

class GetSearchLoadingState extends SearchStates {}
class GetSearchSuccessState extends SearchStates {

  final SearchModel searchModel ;
  GetSearchSuccessState({required this.searchModel});
}
class GetSearchErrorState extends SearchStates {
  var error ;
  GetSearchErrorState({required this.error});
}
class ChangeFavoriteLoadingState extends SearchStates {}
class ChangeFavoriteSuccessState extends SearchStates {
  FavoritesAddOrDeleteModel favoritesAddOrDeleteModel;
  ChangeFavoriteSuccessState({required this.favoritesAddOrDeleteModel});
}
class ChangeFavoriteErrorState extends SearchStates {}