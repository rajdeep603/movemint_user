import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../core/utils/navigator_service.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../order_details_screen/packer_summary_one_page.dart';
import 'models/packer_summary_one_container_model.dart';
import 'provider/packer_summary_one_container_provider.dart';

class PackerSummaryOneContainerScreen extends StatefulWidget {
  const PackerSummaryOneContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  PackerSummaryOneContainerScreenState createState() =>
      PackerSummaryOneContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PackerSummaryOneContainerProvider(),
      child: PackerSummaryOneContainerScreen(),
    );
  }
}
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PackerSummaryOneContainerScreenState
    extends State<PackerSummaryOneContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(milliseconds: 3000), () {
  //     NavigatorService.popAndPushNamed(
  //       AppRoutes.packerSummaryOneOneScreen,
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.packerSummaryOnePage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        // bottomNavigationBar: _buildBottombar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottombar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.packerSummaryOnePage;
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
      case AppRoutes.packerSummaryOnePage:
        return PackerSummaryOnePage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
