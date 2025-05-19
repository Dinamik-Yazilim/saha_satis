import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../product/common/constants/app_constants.dart';
import '../../../product/router/app_router.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _navigation();
    super.initState();
  }

  Future<void> _navigation() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.router.replace(LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 200),
            SizedBox(height: 50),
            Text(AppConstants.appName, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
