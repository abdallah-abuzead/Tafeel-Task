import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tafeel/modules/students/presentation/bloc/single_user/single_user_bloc.dart';
import 'package:tafeel/modules/students/presentation/bloc/users/users_bloc.dart';

import '/core/app_injections/app_injections.dart' as di;
import '/core/screens/splash_screen.dart';
import '../app_routes/app_router.dart';
import '../app_theme/app_theme.dart';
import '../constants/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.getIt<UsersBloc>()..add(GetAllUsersEvent())),
        BlocProvider(create: (context) => di.getIt<SingleUserBloc>()),
      ],
      child: GetMaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(context),
        navigatorKey: AppRouter.navigatorKey,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!),
          );
        },
        home: const SplashScreen(),
      ),
    );
  }
}
