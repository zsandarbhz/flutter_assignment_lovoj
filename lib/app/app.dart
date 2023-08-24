import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment_lovoj/app/routes/routes_genarator.dart';
import 'package:flutter_assignment_lovoj/core/bloc/timer/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/bloc/bloc.dart';
import '../utils/colors.dart';
import '../view/splash/splash_page.dart';
import 'app_config.dart';
import 'routes/paths.dart';
import 'di_container.dart' as di;

Future<Widget> initializeApp(AppConfig appConfig) async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await di.init(appConfig.baseUrl);
  return MultiBlocProvider(
    providers: [
      BlocProvider<ValidationBloc>(create: (context) => di.sl<ValidationBloc>()),
      BlocProvider<TimerBloc>(create: (context) => di.sl<TimerBloc>()),
      BlocProvider<LoginBloc>(create: (context) => di.sl<LoginBloc>()),
      BlocProvider<CheckEmailBloc>(create: (context) => di.sl<CheckEmailBloc>(),),
      BlocProvider<SignupBloc>(create: (context) => di.sl<SignupBloc>(),),
      BlocProvider<LogoutBloc>(create: (context) => di.sl<LogoutBloc>(),),
    ],
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('hi')],
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        child: MyApp(appConfig) ),
  );
}

class MyApp extends StatelessWidget {
  final AppConfig appConfig;
  const MyApp(this.appConfig, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lovoj',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Paths.splashRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
            color: ColorPalettes.colorPrimary),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: ColorPalettes.colorPrimary),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashPage(),
    );
    return materialApp;
  }
}

