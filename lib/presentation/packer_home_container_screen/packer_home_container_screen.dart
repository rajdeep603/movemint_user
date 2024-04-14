import 'package:nested/nested.dart';

import '../../core/app_export.dart';
import '../../domain/providers/create_order_provider.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../new_order_tracking_profile_screens/edit_profile_one_screen/edit_profile_one_screen.dart';
import '../new_order_tracking_profile_screens/edit_profile_screen/edit_profile_screen.dart';
import '../order_list_screen/order_list_screen.dart';
import '../packer_home_page/packer_home_page.dart';
import '../packer_summary_one_screen/packer_summary_one_screen.dart';
import 'models/packer_home_container_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_home_container_provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  DashBoardState createState() => DashBoardState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => PackerHomeContainerProvider(),
        child: DashBoard());
  }
}

// ignore_for_file: must_be_immutable
class DashBoardState extends State<DashBoard> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   NavigatorService.popAndPushNamed(
    //     AppRoutes.packerDetailsWithinCityTabContainerScreen,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.packerHomePage,
                onGenerateRoute: (RouteSettings routeSetting) =>
                    PageRouteBuilder(
                        pageBuilder: (BuildContext ctx, Animation<double> ani,
                                Animation<double> ani1) =>
                            getCurrentPage(context, routeSetting.name!),
                        transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.packerHomePage;
      case BottomBarEnum.Orders:
        return AppRoutes.ordersPage;
      case BottomBarEnum.Payment:
        return AppRoutes.editProfileScreen;

      case BottomBarEnum.Profile:
        return AppRoutes.editProfileOneScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.packerHomePage:
        return PackerHomePage.builder(context);
      case AppRoutes.ordersPage:
        return OrderListScreen.builder(context);
      case AppRoutes.editProfileScreen:
        return EditProfileScreen.builder(context);
      case AppRoutes.editProfileOneScreen:
        return EditProfileOneScreen.builder(context);

      default:
        return DefaultWidget();
    }
  }
}
