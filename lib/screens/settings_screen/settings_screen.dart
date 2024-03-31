

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubit/settings_cubit/settings_cubit.dart';
import 'package:shop/screens/settings_screen/components/Settings_body_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SettingsCubit()..getProfileData(),
      child: SettingsBodyScreen(),
    );
  }
}
