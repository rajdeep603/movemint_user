import 'package:movemint_user/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_user_detail_text_fields.dart';
import '../packer_home_page/packer_home_page.dart';
import 'models/register_screen_route_model.dart';
import 'package:flutter/material.dart';
import 'provider/register_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();

  static Widget builder(BuildContext context) {
    final RegisterScreenRouteModel routeModel =
        ModalRoute.of(context)!.settings.arguments! as RegisterScreenRouteModel;
    return ChangeNotifierProvider<RegisterProvider>(
      create: (BuildContext context) => RegisterProvider(context, routeModel),
      child: const RegisterScreen(),
    );
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  late RegisterProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<RegisterProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: provider.formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 27.h,
                  vertical: 12.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 83.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "msg_add_your_details".tr,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 60.v),
                    Text(
                      "lbl_first_name".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 13.v),
                    _buildFirstName(context),
                    SizedBox(height: 13.v),
                    Text(
                      "lbl_last_name".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 13.v),
                    _buildLastName(context),
                    SizedBox(height: 13.v),
                    Text(
                      "lbl_e_mail_address".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 13.v),
                    _buildEmail(context),
                    SizedBox(height: 13.v),
                    Text(
                      "lbl_password".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 13.v),
                    _buildPassword(context),
                    SizedBox(height: 13.v),
                    Text(
                      "msg_confirm_password".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 13.v),
                    _buildConfirmpassword(context),
                    SizedBox(height: 96.v),
                    _buildSubmit(context),
                    // SizedBox(height: 83.v),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: SizedBox(
                    //     height: 9.v,
                    //     child: AnimatedSmoothIndicator(
                    //       activeIndex: 0,
                    //       count: 3,
                    //       effect: ScrollingDotsEffect(
                    //         spacing: 9.99,
                    //         activeDotColor: appTheme.lightGreen400,
                    //         dotColor: appTheme.lightGreen4006c,
                    //         dotHeight: 9.v,
                    //         dotWidth: 9.h,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 31.v),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: SizedBox(
                    //     width: 128.h,
                    //     child: Divider(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 8.h),
        child: UserDetailsTextFieldContainer(
          controller: provider.firstNameController,
          hintText: "msg_enter_your_first".tr,
          obscureText: false,
        ));
  }

  /// Section Widget
  Widget _buildLastName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: UserDetailsTextFieldContainer(
        controller: provider.lastNameController,
        hintText: "msg_enter_your_last".tr,
        obscureText: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: UserDetailsTextFieldContainer(
        controller: provider.emailController,
        hintText: "msg_enter_your_email".tr,
        obscureText: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: UserDetailsTextFieldContainer(
        controller: provider.passwordController,
        hintText: "msg_enter_a_password".tr,
        obscureText: true,
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirmpassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: UserDetailsTextFieldContainer(
        controller: provider.confirmPasswordController,
        hintText: "msg_confirm_password2".tr,
        obscureText: true,
      ),
    );
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () => provider.onSubmitButtonClicked(),
      text: "lbl_submit".tr,
      margin: EdgeInsets.only(left: 3.h),
    );
  }
}
