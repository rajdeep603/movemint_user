import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
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
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale(
                    'en',
                    '',
                  ),
                ],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
