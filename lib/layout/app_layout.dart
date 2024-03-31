import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';

import 'package:shop/routes/app_links.dart';
import 'package:shop/services/cache_helper.dart';
import 'package:shop/utility/app_colores.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    print("search");
                    Navigator.pushNamed(context, ScreensNames.search);
                  },
                  icon: Icon(Icons.search,
                      size: 30, color: Theme.of(context).canvasColor)),
              IconButton(
                  onPressed: () {
                    AppLayoutCubit.get(context).changeThemeMode();
                  },
                  icon: AppLayoutCubit.get(context).isDark
                      ? Icon(Icons.light_mode_outlined,
                          size: 30, color: Theme.of(context).canvasColor)
                      : Icon(Icons.dark_mode_outlined,
                          size: 30, color: Theme.of(context).canvasColor)),
              IconButton(
                  onPressed: () {
                    CacheHelper.removeData(key: "token").then((value) {
                      Navigator.pushReplacementNamed(
                          context, ScreensNames.login);
                    });
                  },
                  icon: Icon(Icons.logout_outlined,
                      size: 30, color: Theme.of(context).canvasColor)),
            ],
            title: Text(
              "Shop App",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.tabs,
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeCurrentIndex(value);
            },
          ),
          floatingActionButton: Stack(
            alignment: Alignment.topRight,
            children: [
              FloatingActionButton.small(
                onPressed: () {
                  print("cart");
                  // Navigator.pushNamed(context, ScreensNames.cart);
                  AppLayoutCubit.get(context).getCartsData();
                  Navigator.pushNamed(context, ScreensNames.cart);
                },
                backgroundColor: AppColors.secondaryColor,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          body: AppLayoutCubit.get(context)
              .tabsScreen[AppLayoutCubit.get(context).currentIndex],
        );
      },
    );
  }
}
