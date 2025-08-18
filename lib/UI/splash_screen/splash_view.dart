import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/UI/Splash_Screen/splash_viewmodel.dart';

import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashViewmodel(),
      builder: (context, model, child) {
        return Scaffold(body: Center());
      },
    );
  }
}
