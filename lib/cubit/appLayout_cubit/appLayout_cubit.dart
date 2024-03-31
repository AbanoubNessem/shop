import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/components/constants.dart';
import 'package:shop/cubit/Categories_cubit/categories_state.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/models/carts_model/add_and_delete_cart_model.dart';
import 'package:shop/models/carts_model/carts_model.dart';
import 'package:shop/models/categories_model/categories_model.dart';
import 'package:shop/models/favorites_model/favorites_add_or_delete_model.dart';
import 'package:shop/models/home_model/home_model.dart';
import 'package:shop/screens/categories_screen/categories_screen.dart';
import 'package:shop/screens/favorites_screen/favorites_screen.dart';
import 'package:shop/screens/home_screen/home_screen.dart';
import 'package:shop/screens/settings_screen/settings_screen.dart';

import 'package:shop/services/cache_helper.dart';
import 'package:shop/services/dio_helper.dart';
import 'package:shop/services/end_points.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates>{
  AppLayoutCubit():super(HomeInitialState());

  static AppLayoutCubit get(context) => BlocProvider.of<AppLayoutCubit>(context);

  bool isDark = false;
  List<BottomNavigationBarItem> tabs = [
    const BottomNavigationBarItem(
        icon:Icon(Icons.home_outlined),
        label:"Home"
    ),
    const BottomNavigationBarItem(
        icon:Icon(Icons.apps_outlined),
        label:"Categories"
    ),
    const BottomNavigationBarItem(
        icon:Icon(Icons.favorite_outline_outlined),
        label:"Favorites"
    ),
    const BottomNavigationBarItem(
        icon:Icon(Icons.settings_outlined),
        label:"Settings"
    ),
  ];
  List<Widget> tabsScreen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen()
  ];
  int currentIndex = 0;
  HomeModel homeModel = HomeModel();

  void changeThemeMode({bool? themeApp}) {
    if (themeApp != null) {
      isDark = themeApp;
      emit(ChangeThemeModeSuccessState(isDark: isDark));
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: "themeMode", value: isDark);
      emit(ChangeThemeModeSuccessState(isDark: isDark));
    }
  }
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState(index: index));
  }
  Map<int,bool> favorites = {} ;
  FavoritesAddOrDeleteModel favoritesAddOrDeleteModel = FavoritesAddOrDeleteModel();
  CartsModel cartsModel = CartsModel() ;
  void getCartsData(){
    emit(GetCartsLoadingState());
    DioHelper.getData(url: CARTS,token: token).then((value){
      cartsModel = CartsModel.fromJson(value.data);
      print(cartsModel.data!.total);
      emit(GetCartsSuccessState(cartsModel: cartsModel));
    }).catchError((error){
      print("ERROR FROM GET FAVORITES DATA ::: $error");
      emit(GetCartsErrorState(error: error));
    });
  }
  Map<int,bool> carts = {} ;
  AddAddDeleteCartModel addAddDeleteCartModel = AddAddDeleteCartModel();
  void changeCarts({required int productId }){
    carts[productId] = !carts[productId]!;
    emit(ChangeCartsLoadingState());
    DioHelper.postData(
        url: CARTS,
        // token: token,
        lang: "en",
        token: token,
        data: {
          "product_id":productId
        }
    ).then((value){
      addAddDeleteCartModel = AddAddDeleteCartModel.fromJson(value.data);
      print(addAddDeleteCartModel.message);
      if(!addAddDeleteCartModel.status!){
        carts[productId] = !carts[productId]!;
      }
      emit(ChangeCartsSuccessState(addAddDeleteCartModel: addAddDeleteCartModel));
    }).catchError((error){
      carts[productId] = !carts[productId]!;
      print("ERROR FROM GET FAVORITES PRODUCT ::: $error");
      emit(ChangeCartsErrorState());
    });
  }
  void changeFavorites({required int productId }){
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoritesLoadingState());
    DioHelper.postData(
        url: FAVORITES,
        // token: token,
        lang: "en",
        token: token,
        data: {
          "product_id":productId
        }
    ).then((value){
      favoritesAddOrDeleteModel = FavoritesAddOrDeleteModel.fromJson(value.data);
      print(favoritesAddOrDeleteModel.message);
      if(!favoritesAddOrDeleteModel.status!){
        favorites[productId] = !favorites[productId]!;
      }
      emit(ChangeFavoritesSuccessState(favoritesAddOrDeleteModel:favoritesAddOrDeleteModel ));
    }).catchError((error){
      favorites[productId] = !favorites[productId]!;
      print("ERROR FROM GET FAVORITES PRODUCT ::: $error");
      emit(ChangeFavoritesErrorState());
    });
  }
  void getHomeData(){
    emit(GetDataLoadingState());
    DioHelper.getData(url: HOME,token: token).then((value){
      homeModel = HomeModel.fromJson(value.data);
      homeModel.data!.products!.forEach((element) {
        favorites.addAll({
          element.id:element.inFavorites
        });
        carts.addAll({
          element.id:element.inCart
        });
      });
      print(homeModel.data!.banners![0].image);
      print(token);
      emit(GetDataSuccessState(homeModel: homeModel));
    }).catchError((error){
      print("ERROR FROM GET HOME DATA ::: $error");
      emit(GetDataErrorState(error: error));
    });
  }
  Future<bool?> showMessage(String message, MaterialColor green){
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  // CategoriesModel categoriesModel = CategoriesModel();
  //
  //
  // void getCategoriesData(){
  //   emit(GetCategoriesLoadingState());
  //   DioHelper.getData(url: CATEGORIES,token: token).then((value){
  //     categoriesModel = CategoriesModel.formJson(value.data);
  //     print(categoriesModel.data!.data![0].image);
  //     emit(GetCategoriesSuccessState(categoriesModel: categoriesModel));
  //   }).catchError((error){
  //     print("ERROR FROM GET CATEGORIES DATA ::: $error");
  //     emit(GetCategoriesErrorState(error: error));
  //   });
  // }

}