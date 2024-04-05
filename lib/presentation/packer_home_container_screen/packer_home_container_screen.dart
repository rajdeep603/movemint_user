import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../packer_home_page/packer_home_page.dart';
import 'models/packer_home_container_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_home_container_provider.dart';

class PackerHomeContainerScreen extends StatefulWidget {
  const PackerHomeContainerScreen({Key? key}) : super(key: key);

  @override
  PackerHomeContainerScreenState createState() =>
      PackerHomeContainerScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PackerHomeContainerProvider(),
        child: PackerHomeContainerScreen());
  }
}

// ignore_for_file: must_be_immutable
class PackerHomeContainerScreenState extends State<PackerHomeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.packerDetailsWithinCityTabContainerScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.packerHomePage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
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
        return "/";
      case BottomBarEnum.Payment:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
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
      default:
        return DefaultWidget();
    }
  }
}
