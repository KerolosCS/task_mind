import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/cubit/more_cubit.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/navigation_cubit.dart';
import 'package:task_mind/core/bloc_op.dart';
import 'package:task_mind/core/constants.dart';
import 'package:task_mind/core/utils/api_service.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('ar'),
      child: const TaskApp(),
    ),
  );
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.setLocale(const Locale('ar'));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(ApiService(Dio())),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => MoreCubit(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
          ),
          primaryColor: primaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
