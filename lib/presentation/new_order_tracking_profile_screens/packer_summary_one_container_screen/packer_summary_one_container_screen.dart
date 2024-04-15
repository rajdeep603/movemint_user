// import 'package:flutter/material.dart';
// import '../../../core/app_export.dart';
// import '../../../core/utils/navigator_service.dart';
// import '../../../routes/app_routes.dart';
// import '../../../widgets/custom_bottom_bar.dart';
// import '../order_details_screen/package_order_detail_screen.dart';
// import 'models/packer_summary_one_container_model.dart';
// import 'provider/packer_summary_one_container_provider.dart';
//
// class PackageOrderDetailScreen extends StatefulWidget {
//   const PackageOrderDetailScreen({Key? key})
//       : super(
//           key: key,
//         );
//
//   @override
//   PackageOrderDetailScreenState createState() =>
//       PackageOrderDetailScreenState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => PackageOrderDetailProvider(),
//       child: PackageOrderDetailScreen(),
//     );
//   }
// }
// // ignore_for_file: must_be_immutable
//
// // ignore_for_file: must_be_immutable
// class PackageOrderDetailScreenState
//     extends State<PackageOrderDetailScreen> {
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   Future.delayed(const Duration(milliseconds: 3000), () {
//   //     NavigatorService.popAndPushNamed(
//   //       AppRoutes.packerSummaryOneOneScreen,
//   //     );
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Navigator(
//           key: navigatorKey,
//           initialRoute: AppRoutes.packerSummaryOnePage,
//           onGenerateRoute: (routeSetting) => PageRouteBuilder(
//             pageBuilder: (ctx, ani, ani1) =>
//                 getCurrentPage(context, routeSetting.name!),
//             transitionDuration: Duration(seconds: 0),
//           ),
//         ),
//         // bottomNavigationBar: _buildBottombar(context),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildBottombar(BuildContext context) {
//     return CustomBottomBar(
//       onChanged: (BottomBarEnum type) {
//         Navigator.pushNamed(
//             navigatorKey.currentContext!, getCurrentRoute(type));
//       },
//     );
//   }
//
//   ///Handling route based on bottom click actions
//   String getCurrentRoute(BottomBarEnum type) {
//     switch (type) {
//       case BottomBarEnum.Home:
//         return AppRoutes.packerSummaryOnePage;
//       case BottomBarEnum.Orders:
//         return "/";
//       case BottomBarEnum.Payment:
//         return "/";
//       case BottomBarEnum.Profile:
//         return "/";
//       default:
//         return "/";
//     }
//   }
//
//   ///Handling page based on route
//   Widget getCurrentPage(
//     BuildContext context,
//     String currentRoute,
//   ) {
//     switch (currentRoute) {
//       case AppRoutes.packerSummaryOnePage:
//         return PackerSummaryOnePage.builder(context);
//       default:
//         return DefaultWidget();
//     }
//   }
// }
