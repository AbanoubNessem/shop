import 'package:shop/layout/app_layout.dart';
import'package:shop/routes/app_links.dart';
import 'package:shop/screens/cart_screen/cart_screen.dart';
import 'package:shop/screens/categories_items_screen/categories_items_screen.dart';
import 'package:shop/screens/favorites_screen/components/product_details_favorites_screen.dart';

import 'package:shop/screens/login_screen/login_screen.dart';
import 'package:shop/screens/onBoarding_screen/onBoarding_screen.dart';
import 'package:shop/screens/product_details/product_details_screen.dart';
import 'package:shop/screens/register_screen/register_screen.dart';
import 'package:shop/screens/search_screen/components/search_item_details_screen.dart';
import 'package:shop/screens/search_screen/search_screen.dart';

import '../screens/categories_items_screen/components/categories_item.dart';


appRoutes(context){
var routes ={
  ScreensNames.onBoarding :(context)=> const OnBoardingScreen(),
  ScreensNames.appLayout :(context)=> const AppLayout(),
  ScreensNames.login :(context)=> const LoginScreen(),
  ScreensNames.register :(context)=> const RegisterScreen(),
  ScreensNames.search :(context)=> const SearchScreen(),
  ScreensNames.cart :(context)=> const CartScreen(),
  ScreensNames.product :(context)=> const ProductDetailsScreen(),
  ScreensNames.categoriesItems :(context)=> const CategoriesItemsScreen(),
  ScreensNames.favoritesItems : (context)=> const ProductDetailsFavoritesScreen(),
  ScreensNames.searchItems : (context)=> const SearchItemDetailsScreen()
};
return routes;
}