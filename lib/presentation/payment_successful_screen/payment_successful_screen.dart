import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movemint_user/presentation/payment_successful_screen/provider/payment_success_provider.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class PaymentSuccessFulScreen extends StatefulWidget {
  const PaymentSuccessFulScreen({super.key});

  @override
  State<PaymentSuccessFulScreen> createState() =>
      _PaymentSuccessFulScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentSuccessProvider(),
      child: PaymentSuccessFulScreen(),
    );
  }
}

class _PaymentSuccessFulScreenState extends State<PaymentSuccessFulScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buildColumnMake(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Container(
                      height: 570.v,
                      width: 400.h,
                      // color: Colors.red,
                      child: Image.asset(
                        "assets/images/Subtract.png",
                        fit: BoxFit.cover,
                      )),
                ),
                Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 60.v,
                    ),
                    const SizedBox(
                      width: 280,
                      child: Column(
                        children: [
                          Text(
                            "Successfully Booked!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Your booking payment has successfully done.",
                            style: TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Divider(
                            color: Colors.white24,
                            thickness: 1.5,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    const Text(
                      "₹500",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white24),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "From",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                Text(
                                  "9th Main, Nehru street",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 80,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white24),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                Text(
                                  "9th Main, Nehru street",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.green,
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                "Booking Amount",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            ),
                            Text(
                              "(₹500)",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                            width: 80,
                            height: 1,
                            color: Colors.white24,
                          ),
                        ),
                        const Column(
                          children: [
                            CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: Center(
                                    child: CircleAvatar(
                                  radius: 5,
                                ))),
                            SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                textAlign: TextAlign.center,
                                "At the Time of Unloading",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                            ),
                            Text(
                              "(₹2000)",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
                Positioned(
                  top: -30,
                  child: CircleAvatar(
                    radius: 41,
                    backgroundColor: appTheme.purple900,
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green,
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColumnMake(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 22.h,
        right: 22.h,
        bottom: 20.v,
      ),
      // decoration: AppDecoration.outlineGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomElevatedButton(
            buttonStyle: const ButtonStyle(),
            width: 181.h,
            text: "Home",
            buttonTextStyle: CustomTextStyles.titleMediumRalewayWhiteA700,
          ),
          CustomElevatedButton(
            width: 181.h,
            text: "Track Order".tr,
            buttonTextStyle: CustomTextStyles.titleMediumRalewayWhiteA700,
          )
        ],
      ),
    );
  }
}
