import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/app_export.dart';
import '../domain/providers/app_state_provider.dart';
import 'app_bar/custom_app_bar.dart';
import 'custom_icon.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  static Widget builder(BuildContext context) {
    return const NoInternetScreen();
  }

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  late AppStateProvider provider;

  @override
  void initState() {
    super.initState();
    context.read<AppStateProvider>().isNoInternetScreenOpen = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = context.read<AppStateProvider>();
  }

  @override
  void dispose() {
    provider.isNoInternetScreenOpen = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: NavigatorService.canPop()
            ? CustomIcon(
                Icons.arrow_back,
                onTap: () => provider.onGoBack(),
              )
            : null,
      ),
      body: Center(child: Lottie.asset(ImageConstant.noInternetLottie)),
    );
  }
}
