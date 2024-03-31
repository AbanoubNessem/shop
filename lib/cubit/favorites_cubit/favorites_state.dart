import 'package:shop/models/favorites_model/favorites_add_or_delete_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_model.dart';

abstract class FavoritesStates {}
class FavoritesInitialState extends FavoritesStates {}

class GetFavoritesLoadingState extends FavoritesStates {}
class GetFavoritesSuccessState extends FavoritesStates {

  final FavoritesModel favoritesModel ;
  GetFavoritesSuccessState({required this.favoritesModel});
}
class GetFavoritesErrorState extends FavoritesStates {
  var error ;
  GetFavoritesErrorState({required this.error});
}
class ChangeFavoritesLoadingState extends FavoritesStates {}
class ChangeFavoritesSuccessState extends FavoritesStates {
  FavoritesAddOrDeleteModel favoritesAddOrDeleteModel;
  ChangeFavoritesSuccessState({required this.favoritesAddOrDeleteModel});
}
class ChangeFavoritesErrorState extends FavoritesStates {}