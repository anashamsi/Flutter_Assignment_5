import 'package:flutter_assignment_5/app/app.locator.dart';
import 'package:flutter_assignment_5/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToMainView() {
    _navigationService.replaceWithMainView();
  }

  bool ischeck = false;

  bool get _ischeck => ischeck;

  checkbox(bool? value) {
    // remmeber me check box
    ischeck = value ?? false;
    notifyListeners();
  }
}
