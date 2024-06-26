import '../../core/app_export.dart';
import '../../domain/models/create_order_request_model.dart';
import '../../domain/providers/create_order_provider.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon.dart';
import '../packer_additems_two_tab_container_screen/provider/packer_additems_two_tab_container_provider.dart';
import '../packer_summary_one_screen/packer_summary_one_screen.dart';
import '../packer_summary_one_screen/summary_one_screen.dart';
import '../packer_summary_two_screen/packer_summary_two_screen.dart';
import 'models/packer_additems_one_model.dart';
import 'package:flutter/material.dart';
import 'provider/packer_additems_one_provider.dart';

// ignore_for_file: must_be_immutable
class PackerAdditemsOnePage extends StatefulWidget {
  const PackerAdditemsOnePage({super.key});

  @override
  PackerAdditemsOnePageState createState() => PackerAdditemsOnePageState();

  static Widget builder(BuildContext context) {
    return PackerAdditemsOnePage();
  }
}

class PackerAdditemsOnePageState extends State<PackerAdditemsOnePage>
    with AutomaticKeepAliveClientMixin<PackerAdditemsOnePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  late PackerAddItemsProvider provider;
  late CreateOrderProvider createOrderProvider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<PackerAddItemsProvider>(context);
    createOrderProvider = Provider.of<CreateOrderProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _listWidget(),
          ],
        ),
      ),
    );
  }

  Widget _listWidget() {
    return Expanded(
        child: ListView.builder(
            itemCount:createOrderProvider.productDetail.length,
            itemBuilder: (BuildContext context, int index) {
              final ProductDetailModel data =createOrderProvider.productDetail[index];
              return _buildHorizontalCard(data);
            }));
  }

  /// Section Widget
  Widget _buildHorizontalCard(ProductDetailModel data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name, style: CustomTextStyles.titleMediumBlack900),
                  SizedBox(height: 3.v),
                  Text('${data.items.length} Items',
                      style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
        children: List.generate(data.items.length, (int index) {
          final ItemModel item = data.items[index];
          return ListTile(
            title: Text(item.name, style: CustomTextStyles.titleMediumBlack900),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    if (item.qty != 0) {
                      item.qty = item.qty - 1;
                      if (data.items
                          .any((ItemModel element) => element.qty != 0)) {
                        data.doesItemsHaveQty = true;
                      } else {
                        data.doesItemsHaveQty = false;
                      }
                      createOrderProvider.notifyListeners();
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: appTheme.whiteA700, shape: BoxShape.circle),
                      child: CustomIcon(
                        Icons.remove,
                        color: item.qty == 0
                            ? appTheme.gray400
                            : appTheme.green400,
                      )),
                ),
                SizedBox(width: 10.h),
                Text(
                  item.qty.toString(),
                  style: CustomTextStyles.titleMediumBlack900,
                ),
                SizedBox(width: 10.h),
                InkWell(
                  onTap: () {
                    item.qty = item.qty + 1;
                    data.doesItemsHaveQty = true;
                    createOrderProvider.notifyListeners();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: appTheme.whiteA700, shape: BoxShape.circle),
                      child: CustomIcon(
                        Icons.add,
                        color: appTheme.green400,
                      )),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalCard1(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_bedroom_room".tr,
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 3.v),
                Text(
                  "lbl_5_items".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPurple900,
            height: 12.adaptSize,
            width: 12.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 12.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalCard2(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_kitchen".tr,
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 3.v),
                Text(
                  "lbl_5_items".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRightPurple900,
            height: 12.adaptSize,
            width: 12.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 12.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildActionBottom2(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillOnErrorContainer,
      child: Column(
        children: [
          SizedBox(height: 32.v),
          Container(
            width: double.maxFinite,
            decoration: AppDecoration.outlineGray300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 41.v,
                    bottom: 16.v,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_total_items".tr,
                          style: CustomTextStyles.titleMediumInterff71727a,
                        ),
                        TextSpan(
                          text: "lbl_0".tr,
                          style: CustomTextStyles.titleMediumInterff000000,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SummaryOne()));
                  },
                  width: 224.h,
                  text: "test_next",
                  // text: "lbl_next".tr,
                  margin: EdgeInsets.only(top: 25.v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
