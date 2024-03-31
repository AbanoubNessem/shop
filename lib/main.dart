import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/constants.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_cubit.dart';
import 'package:shop/cubit/appLayout_cubit/appLayout_state.dart';
import 'package:shop/cubit/bloc_observer.dart';

import 'package:shop/layout/app_layout.dart';
import 'package:shop/routes/app_links.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/screens/login_screen/login_screen.dart';
import 'package:shop/screens/onBoarding_screen/onBoarding_screen.dart';
import 'package:shop/services/cache_helper.dart';
import 'package:shop/services/dio_helper.dart';
import 'package:shop/utility/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();
  String widget;
  bool? onBoarding = CacheHelper.getBoolData(key: "onBoarding");
  token = CacheHelper.getStringData(key: "token");
  bool? isDark = CacheHelper.getBoolData(key: "themeMode");
  if (onBoarding != null) {
    if (token != null) {
      widget = ScreensNames.appLayout;
    } else {
      widget = ScreensNames.login;
    }
  } else {
    widget = ScreensNames.onBoarding;
  }
  runApp(MyApp(
    widget: widget,
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.widget, required this.isDark});

  final String? widget;
  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppThemes appThemes = AppThemes();
    return BlocProvider(
      create: (context) => AppLayoutCubit()..changeThemeMode(themeApp: isDark)..getHomeData(),
      child: BlocConsumer<AppLayoutCubit, AppLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: AppLayoutCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: appThemes.appThemeDark,
            theme: appThemes.appThemeLight,
            initialRoute: widget,
            routes: appRoutes(context),
          );
        },
      ),
    );
  }
}
