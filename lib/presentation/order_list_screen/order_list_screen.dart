import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../domain/models/get_orders_model.dart';
import '../../domain/providers/order_list_repo_provider.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon.dart';
import '../new_order_tracking_profile_screens/order_details_screen/models/package_order_detail_route_model.dart';
import '../new_order_tracking_profile_screens/packer_summary_one_container_screen/packer_summary_one_container_screen.dart';
import 'order_list_provder.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OrderListScreenProvider(context),
      child: OrderListScreen(),
    );
  }

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  late OrderListScreenProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<OrderListScreenProvider>(context);
    return Consumer<GetOrdersListRepoProvider>(builder: (BuildContext context,
        GetOrdersListRepoProvider orderListProvider, Widget? child) {
      if (orderListProvider.getOrderModel == null) {
        orderListProvider.getOrdersData();
      }
      // provider.getOrderModel = orderListProvider.getOrderModel;
      return Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.v),
            Text('Order List', style: CustomTextStyles.titleMediumBlack900),
            Expanded(
                child: orderListProvider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : orderListProvider.getOrderModel == null
                        ? Text(
                            'No Order Found',
                            style: CustomTextStyles.labelLargeMedium,
                          )
                        : ListView.builder(
                            itemCount:
                                orderListProvider.getOrderModel!.orders?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Order order = orderListProvider
                                  .getOrderModel!.orders![index];
                              Logger.log('order.orderId:${order.id}');
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.v),
                                child: GestureDetector(
                                  onTap: () {
                                    final PackageOrderDetailRouteModel
                                        routeModel =
                                        PackageOrderDetailRouteModel(
                                            orderId: order.id ?? '',
                                            orderStatus: order.status ?? '');
                                    NavigatorService.pushNamed(
                                            AppRoutes.packageOrderDetailScreen,
                                            arguments: routeModel)
                                        .then((_) {
                                      orderListProvider.getOrdersData();
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.v, horizontal: 15.h),
                                    color: appTheme.gray50,
                                    child: Row(
                                      children: <Widget>[
                                        CustomImageView(
                                          imagePath: ImageConstant.imgUser,
                                        ),
                                        SizedBox(width: 20.h),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text('# ${order.id} ',
                                                    style: CustomTextStyles
                                                        .titleSmallMedium),
                                                if (order.status?.isNotEmpty ??
                                                    false)
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          color: order.status
                                                                      ?.toLowerCase() ==
                                                                  'confirm'
                                                              ? appTheme
                                                                  .green400
                                                              : Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3),
                                                        child: Text(
                                                          order.status?.toLowerCase() ==
                                                                  'cancel'
                                                              ? 'Cancelled'
                                                              : order.status ??
                                                                  "",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )),
                                              ],
                                            ),
                                            Text(
                                                order.datetime?.format(
                                                        DateTimeUtils
                                                            .dMonFormat) ??
                                                    'NA',
                                                style: CustomTextStyles
                                                    .titleSmallMedium),
                                          ],
                                        ),
                                        const Spacer(),
                                        CustomIcon(
                                          Icons.keyboard_arrow_right,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }))
          ],
        ),
      );
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 44.h,
        centerTitle: true,
        title: AppbarTitle(text: 'Order History'),
        styleType: Style.bgFill);
  }
}
