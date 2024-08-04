import '../../core/app_export.dart';
import '../../domain/models/create_order_request_model.dart';
import '../../domain/models/get_item_data_response_model.dart';
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
            itemCount: provider.itemData.data?.length ?? 0,
            // itemCount:createOrderProvider.productDetail.length,
            itemBuilder: (BuildContext context, int index) {
              final data = provider.itemData.data![index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
                decoration: AppDecoration.fillGray5001.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: data.items?.length ?? 0,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int innerIndex) {
                      final productData = data.items![innerIndex];

                      return ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(productData.subcategoryName.toString(),
                                      style:
                                          CustomTextStyles.titleMediumBlack900),
                                  SizedBox(height: 3.v),
                                  Text('${data.items!.length} Items',
                                      style: theme.textTheme.bodySmall),
                                  SizedBox(height: 3.v),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.width / 1.6,
                                    // color: Colors.red,
                                    child: ListView.builder(
                                        itemCount:
                                            productData.items?.length ?? 0,
                                        // scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context,
                                            int itemIndex) {
                                          final itemData =
                                              productData.items![itemIndex];
                                          // itemData.qty = 1;
                                          // final ItemModel item = data.items[index];
                                          return ListTile(
                                            title: Text(
                                                itemData.name.toString(),
                                                style: CustomTextStyles
                                                    .titleMediumBlack900),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () {
                                                    if (itemData.qty != 0) {
                                                      itemData.qty =
                                                          itemData.qty! - 1;
                                                      if (data.items!.any(
                                                          (DatumItem element) =>
                                                              element
                                                                  .items![
                                                                      itemIndex]
                                                                  .qty !=
                                                              0)) {
                                                        data.doesItemsHaveQty =
                                                            true;
                                                      } else {
                                                        data.doesItemsHaveQty =
                                                            false;
                                                      }
                                                      productData.items
                                                          ?.forEach((e) {
                                                        int qty = e.qty ?? 0;
                                                        double price =
                                                            double.tryParse(
                                                                    e.pricePerKm ??
                                                                        '0') ??
                                                                0.0;
                                                        print('qty :$qty');
                                                        print('price :$price');
                                                        provider.totalItmes =
                                                            provider.totalItmes -
                                                                1;
                                                        provider.totalPrice =
                                                            provider.totalPrice -
                                                                price;
                                                      });
                                                      createOrderProvider
                                                          .notifyListeners();
                                                    }
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: appTheme
                                                              .whiteA700,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: CustomIcon(
                                                        size: 30,
                                                        Icons.remove,
                                                        color: itemData.qty == 0
                                                            ? appTheme.gray400
                                                            : appTheme.green400,
                                                      )),
                                                ),
                                                SizedBox(width: 10.h),
                                                Text(
                                                  itemData.qty.toString(),
                                                  // item.qty.toString(),
                                                  style: CustomTextStyles
                                                      .titleMediumBlack900,
                                                ),
                                                SizedBox(width: 10.h),
                                                InkWell(
                                                  onTap: () {
                                                    itemData.qty =
                                                        itemData.qty! + 1;
                                                    data.doesItemsHaveQty =
                                                        true;
                                                    productData.items
                                                        ?.forEach((e) {
                                                      int qty = e.qty ?? 0;
                                                      double price =
                                                          double.tryParse(
                                                                  e.pricePerKm ??
                                                                      '0') ??
                                                              0.0;
                                                      print('qty :$qty');
                                                      print('price :$price');
                                                      provider.totalItmes =
                                                          provider.totalItmes +
                                                              1;
                                                      provider.totalPrice =
                                                          provider.totalPrice +
                                                              price;
                                                    });
                                                    createOrderProvider
                                                        .notifyListeners();
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          color: appTheme
                                                              .whiteA700,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: CustomIcon(
                                                        size: 30,
                                                        Icons.add,
                                                        color:
                                                            appTheme.green400,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          );
                                          //   Row(
                                          //   children: [
                                          //     Text("${itemIndex + 1}. "),
                                          //     Text(itemData.name.toString())
                                          //   ],
                                          // );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // children: List.generate(data.items.length, (int index) {
                  //   final ItemModel item = data.items[index];
                  //   return ListTile(
                  //     title: Text(item.name, style: CustomTextStyles.titleMediumBlack900),
                  //     trailing: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //         InkWell(
                  //           onTap: () {
                  //             if (item.qty != 0) {
                  //               item.qty = item.qty - 1;
                  //               if (data.items
                  //                   .any((ItemModel element) => element.qty != 0)) {
                  //                 data.doesItemsHaveQty = true;
                  //               } else {
                  //                 data.doesItemsHaveQty = false;
                  //               }
                  //               createOrderProvider.notifyListeners();
                  //             }
                  //           },
                  //           child: Container(
                  //               decoration: BoxDecoration(
                  //                   color: appTheme.whiteA700, shape: BoxShape.circle),
                  //               child: CustomIcon(
                  //                 Icons.remove,
                  //                 color: item.qty == 0
                  //                     ? appTheme.gray400
                  //                     : appTheme.green400,
                  //               )),
                  //         ),
                  //         SizedBox(width: 10.h),
                  //         Text(
                  //           item.qty.toString(),
                  //           style: CustomTextStyles.titleMediumBlack900,
                  //         ),
                  //         SizedBox(width: 10.h),
                  //         InkWell(
                  //           onTap: () {
                  //             item.qty = item.qty + 1;
                  //             data.doesItemsHaveQty = true;
                  //             createOrderProvider.notifyListeners();
                  //           },
                  //           child: Container(
                  //               decoration: BoxDecoration(
                  //                   color: appTheme.whiteA700, shape: BoxShape.circle),
                  //               child: CustomIcon(
                  //                 Icons.add,
                  //                 color: appTheme.green400,
                  //               )),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // }),
                ),
              )
                  // _buildHorizontalCard(data)
                  ;
            }));
  }

// /// Section Widget
// Widget _buildHorizontalCard(GetItemDataResponseModel data) {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
//     padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
//     decoration: AppDecoration.fillGray5001.copyWith(
//       borderRadius: BorderRadiusStyle.roundedBorder10,
//     ),
//     child: ExpansionTile(
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(bottom: 1.v),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(data.data!.first.categoryName.toString(),
//                     style: CustomTextStyles.titleMediumBlack900),
//                 SizedBox(height: 3.v),
//                 Text(
//                     '${data.data!.first.items!.first.subcategoryName!.length} Items',
//                     style: theme.textTheme.bodySmall),
//               ],
//             ),
//           ),
//         ],
//       ),
//       // children: List.generate(data.items.length, (int index) {
//       //   final ItemModel item = data.items[index];
//       //   return ListTile(
//       //     title: Text(item.name, style: CustomTextStyles.titleMediumBlack900),
//       //     trailing: Row(
//       //       mainAxisSize: MainAxisSize.min,
//       //       children: <Widget>[
//       //         InkWell(
//       //           onTap: () {
//       //             if (item.qty != 0) {
//       //               item.qty = item.qty - 1;
//       //               if (data.items
//       //                   .any((ItemModel element) => element.qty != 0)) {
//       //                 data.doesItemsHaveQty = true;
//       //               } else {
//       //                 data.doesItemsHaveQty = false;
//       //               }
//       //               createOrderProvider.notifyListeners();
//       //             }
//       //           },
//       //           child: Container(
//       //               decoration: BoxDecoration(
//       //                   color: appTheme.whiteA700, shape: BoxShape.circle),
//       //               child: CustomIcon(
//       //                 Icons.remove,
//       //                 color: item.qty == 0
//       //                     ? appTheme.gray400
//       //                     : appTheme.green400,
//       //               )),
//       //         ),
//       //         SizedBox(width: 10.h),
//       //         Text(
//       //           item.qty.toString(),
//       //           style: CustomTextStyles.titleMediumBlack900,
//       //         ),
//       //         SizedBox(width: 10.h),
//       //         InkWell(
//       //           onTap: () {
//       //             item.qty = item.qty + 1;
//       //             data.doesItemsHaveQty = true;
//       //             createOrderProvider.notifyListeners();
//       //           },
//       //           child: Container(
//       //               decoration: BoxDecoration(
//       //                   color: appTheme.whiteA700, shape: BoxShape.circle),
//       //               child: CustomIcon(
//       //                 Icons.add,
//       //                 color: appTheme.green400,
//       //               )),
//       //         ),
//       //       ],
//       //     ),
//       //   );
//       // }),
//     ),
//   );
// }
}

// List a =[];
// List b =[];
// List c=[a,b];
//
// int items=0;
// double price=0;
//   void abc(){
//     c.forEach((element){
//       element.a.for
//        items=itmes+   c.item;
//       price = price+ (c.price*c.itmes)
//
//     });
//   }
