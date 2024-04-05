import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/app_export.dart';
import '../domain/providers/app_state_provider.dart';
import 'app_bar/custom_app_bar.dart';
import 'custom_icon.dart';

class ServerErrorScreen extends StatefulWidget {
  const ServerErrorScreen({super.key});

  static Widget builder(BuildContext context) {
    return const ServerErrorScreen();
  }

  @override
  State<ServerErrorScreen> createState() => _ServerErrorScreenState();
}

class _ServerErrorScreenState extends State<ServerErrorScreen> {
  late AppStateProvider provider;

  @override
  void initState() {
    super.initState();
    context.read<AppStateProvider>().isSeverErrorScreenOpen = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = context.read<AppStateProvider>();
  }

  @override
  void dispose() {
    provider.isSeverErrorScreenOpen = false;
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
      body: Center(child: Lottie.asset(ImageConstant.serverErrorLottie)),
    );
  }
}
