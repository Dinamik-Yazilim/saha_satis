import 'package:auto_route/auto_route.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../product/common/constants/app_constants.dart';
import 'mixin/splash_view_mixin.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashViewModel,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                child: Assets.images.bigLogo.image(package: 'gen', width: double.infinity, height: 400),
              ),
              SizedBox(height: 50),
              Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  color: Color(0xffea5747),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
