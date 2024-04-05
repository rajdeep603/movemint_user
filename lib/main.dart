import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movemint_user/presentation/app_navigation_screen/provider/app_navigation_provider.dart';
import 'package:movemint_user/presentation/login_screen/provider/login_provider.dart';
import 'package:movemint_user/presentation/onboarding_screen_one_screen/provider/onboarding_screen_one_provider.dart';
import 'package:movemint_user/presentation/onboarding_screen_three_screen/provider/onboarding_screen_three_provider.dart';
import 'package:movemint_user/presentation/onboarding_screen_two_screen/provider/onboarding_screen_two_provider.dart';
import 'package:movemint_user/presentation/otp_verification_screen/provider/otp_verification_provider.dart';
import 'package:movemint_user/presentation/packer_additems_three_bottomsheet/provider/packer_additems_three_provider.dart';
import 'package:movemint_user/presentation/packer_additems_two_page/provider/packer_additems_two_provider.dart';
import 'package:movemint_user/presentation/packer_details_between_cities_page/provider/packer_details_between_cities_provider.dart';
import 'package:movemint_user/presentation/packer_details_date_time_screen/provider/packer_details_date_time_provider.dart';
import 'package:movemint_user/presentation/packer_details_within_city_page/provider/packer_details_within_city_provider.dart';
import 'package:movemint_user/presentation/packer_details_within_city_tab_container_screen/provider/packer_details_within_city_tab_container_provider.dart';
import 'package:movemint_user/presentation/packer_home_container_screen/provider/packer_home_container_provider.dart';
import 'package:movemint_user/presentation/packer_home_page/provider/packer_home_provider.dart';
import 'package:movemint_user/presentation/user_details_screen/provider/user_details_provider.dart';
import 'package:movemint_user/presentation/wellcome_screen/provider/wellcome_provider.dart';
import 'core/app_export.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/utils/enums.dart';
import 'core/utils/server_date_time.dart';
import 'core/utils/toast_helper.dart';
import 'domain/local_storage/local_storage.dart';
import 'domain/providers/app_state_provider.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.initialize();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(Multiprovider());
  });
}

class Multiprovider extends StatelessWidget {
  const Multiprovider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateProvider>(
          create: (BuildContext context) => AppStateProvider(),
        ),
        ChangeNotifierProvider<WellcomeProvider>(
            create: (_) => WellcomeProvider()),
        ChangeNotifierProvider<OtpVerificationProvider>(
            create: (_) => OtpVerificationProvider()),
        ChangeNotifierProvider<OnboardingScreenTwoProvider>(
            create: (_) => OnboardingScreenTwoProvider()),
        ChangeNotifierProvider<OnboardingScreenThreeProvider>(
          create: (_) => OnboardingScreenThreeProvider(),
        ),
        ChangeNotifierProvider<OnboardingScreenOneProvider>(
          create: (_) => OnboardingScreenOneProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider<AppNavigationProvider>(
          create: (_) => AppNavigationProvider(),
        ),
        ChangeNotifierProvider<UserDetailsProvider>(
          create: (_) => UserDetailsProvider(),
        ),
        ChangeNotifierProvider<PackerHomeProvider>(
          create: (_) => PackerHomeProvider(),
        ),
        ChangeNotifierProvider<PackerHomeContainerProvider>(
          create: (_) => PackerHomeContainerProvider(),
        ),
        ChangeNotifierProvider<PackerDetailsWithinCityTabContainerProvider>(
          create: (_) => PackerDetailsWithinCityTabContainerProvider(),
        ),
        ChangeNotifierProvider<PackerDetailsWithinCityProvider>(
          create: (_) => PackerDetailsWithinCityProvider(),
        ),
        ChangeNotifierProvider<PackerDetailsBetweenCitiesProvider>(
          create: (_) => PackerDetailsBetweenCitiesProvider(),
        ),
        ChangeNotifierProvider<PackerDetailsDateTimeProvider>(
          create: (_) => PackerDetailsDateTimeProvider(),
        ),
        ChangeNotifierProvider<PackerAdditemsTwoProvider>(
          create: (_) => PackerAdditemsTwoProvider(),
        ),
        ChangeNotifierProvider<PackerAdditemsThreeProvider>(
          create: (_) => PackerAdditemsThreeProvider(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void initState() {
    super.initState();
    // ServerDateTime().fetchDateTimeFromServer();
    final NetworkInfo networkInfo = NetworkInfo();
    subscription = networkInfo.onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      Logger.log(
          'connectivityResult : ${connectivityResult.map((ConnectivityResult e) => e.name)}');
      if (connectivityResult.every(
          (ConnectivityResult element) => element == ConnectivityResult.none)) {
        ToastHelper.showToast(CustomException.noInternet.message);
      } else {
        if (NavigatorService.navigatorKey.currentContext != null) {
          final bool isNoInternetScreenMounted = NavigatorService
              .navigatorKey.currentContext!
              .read<AppStateProvider>()
              .isNoInternetScreenOpen;
          if (isNoInternetScreenMounted && NavigatorService.canPop()) {
            NavigatorService.goBack();
          }
        }
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    ServerDateTime().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.hasFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: Consumer<ThemeProvider>(
              builder: (context, provider, child) {
                return MaterialApp(
                  theme: theme,
                  title: 'movemint_user',
                  navigatorKey: NavigatorService.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const <LocalizationsDelegate<
                      dynamic>>[
                    AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: [Locale('en', '')],
                  initialRoute: AppRoutes.initialRoute,
                  routes: AppRoutes.routes,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
