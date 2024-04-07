import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../domain/models/get_orders_model.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon.dart';
import 'order_list_provder.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OrderListProvider(context),
      child: OrderListScreen(),
    );
  }

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  late OrderListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<OrderListProvider>(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.v),
          Text('Order List', style: CustomTextStyles.titleMediumBlack900),
          Expanded(
              child: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : provider.getOrderModel == null
                      ? Text(
                          'No Order Found',
                          style: CustomTextStyles.labelLargeMedium,
                        )
                      : ListView.builder(
                          itemCount: provider.getOrderModel!.orders.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Order order =
                                provider.getOrderModel!.orders[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.v),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.v, horizontal: 15.h),
                                color: appTheme.gray50,
                                child: Row(
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgUser,
                                    ),
                                    SizedBox(width: 20.h),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('# ${order.id} ',
                                            style: CustomTextStyles
                                                .titleSmallMedium),
                                        Text(
                                            order.datetime?.format(
                                                    DateTimeUtils.dMonFormat) ??
                                                'NA',
                                            style: CustomTextStyles
                                                .titleSmallMedium),
                                      ],
                                    ),
                                    Spacer(),
                                    CustomIcon(
                                      Icons.keyboard_arrow_right,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))
        ],
      ),
    );
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
