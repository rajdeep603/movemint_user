import 'package:flutter/material.dart';

import '../core/utils/enums.dart';
import '../core/utils/logger.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/new_order_tracking_profile_screens/order_details_screen/package_order_detail_screen.dart';
import '../presentation/new_order_tracking_profile_screens/packer_summary_one_container_screen/packer_summary_one_container_screen.dart';
import '../presentation/new_order_tracking_profile_screens/packer_summary_one_one_screen/packer_summary_one_one_screen.dart';
import '../presentation/onboarding_screen_one_screen/onboarding_screen_one_screen.dart';
import '../presentation/onboarding_screen_three_screen/onboarding_screen_three_screen.dart';
import '../presentation/onboarding_screen_two_screen/onboarding_screen_two_screen.dart';
import '../presentation/otp_verification_screen/otp_verification_screen.dart';
import '../presentation/packer_additems_two_tab_container_screen/packer_additems_two_tab_container_screen.dart';
import '../presentation/packer_details_date_time_screen/packer_details_date_time_screen.dart';
import '../presentation/packer_home_container_screen/packer_home_container_screen.dart';
import '../presentation/packer_home_page/packer_home_page.dart';
import '../presentation/packer_location_set_screen/packer_location_set_screen.dart';
import '../presentation/register_screen/register_screen.dart';
import '../presentation/wellcome_screen/wellcome_screen.dart';
import '../widgets/no_internet_screen.dart';
import '../widgets/server_error_screen.dart';

class AppRoutes {
  static const String noInternetScreen = '/NoInternetScreen';

  static const String serverErrorScreen = '/ServerErrorScreen';

  static const String wellcomeScreen = '/wellcome_screen';

  static const String onboardingScreenTwoScreen =
      '/onboarding_screen_two_screen';

  static const String onboardingScreenThreeScreen =
      '/onboarding_screen_three_screen';

  static const String otpVerificationScreen = '/otp_verification_screen';

  static const String registerScreen = '/register_screen';

  static const String onboardingScreenOneScreen =
      '/onboarding_screen_one_screen';

  static const String dashboard = '/dashboard';

  static const String packerHomePage = '/packer_home_page';

  static const String ordersPage = '/orders_page';

  static const String packerDetailsWithinCityPage =
      '/packer_details_within_city_page';

  static const String packerLocationSetScreen = '/packer_location_set_screen';

  static const String packerDetailsBetweenCitiesPage =
      '/packer_details_between_cities_page';

  static const String loginScreen = '/login_screen';

  static const String packerAdditemsTwoPage = '/packer_additems_two_page';

  static const String packerAdditemsScreen =
      '/packer_additems_two_tab_container_screen';

  static const String packerDetailsDateTimeScreen =
      '/packer_details_date_time_screen';

  static const String packerAdditemsOnePage = '/packer_additems_one_page';

  static const String packerSummaryOneScreen = '/packer_summary_one_screen';

  static const String packerSummaryTwoScreen = '/packer_summary_two_screen';

  //tracking and profile
  static const String packerSummaryOneContainerScreen =
      '/packer_summary_one_container_screen';

  static const String packerSummaryOnePage = '/packer_summary_one_page';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String packerSummaryOneOneScreen =
      '/packer_summary_one_one_screen';

  static const String editProfileOneScreen = '/edit_profile_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String packageOrderDetailScreen = '/package_order_detail_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        initialRoute: Logger.mode == LogMode.debug
            ? WellcomeScreen.builder
            : WellcomeScreen.builder,
        noInternetScreen: NoInternetScreen.builder,
        serverErrorScreen: ServerErrorScreen.builder,
        wellcomeScreen: WellcomeScreen.builder,
        onboardingScreenOneScreen: OnboardingScreenOneScreen.builder,
        onboardingScreenTwoScreen: OnboardingScreenTwoScreen.builder,
        onboardingScreenThreeScreen: OnboardingScreenThreeScreen.builder,
        loginScreen: LoginScreen.builder,
        otpVerificationScreen: OtpVerificationScreen.builder,
        registerScreen: RegisterScreen.builder,
        packerHomePage: PackerHomePage.builder,
        packerSummaryOneOneScreen: PackerSummaryOneOneScreen.builder,
        dashboard: DashBoard.builder,
        packerLocationSetScreen: PackerLocationSetScreen.builder,
        packerAdditemsScreen: PackerAdditemsScreen.builder,
        packerDetailsDateTimeScreen: PackerDetailsDateTimeScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
    packageOrderDetailScreen: PackageOrderDetailScreen.builder,
      };
}
