import 'package:flutter/material.dart';
import 'package:flutter_assignment_5/app/UI/Login%20Screen/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => LoginViewmodel(),
      builder: (context, model, child) {
        return Scaffold(body: Center(child: Text('Anas Shamsi')));
      },
    );
  }
}
