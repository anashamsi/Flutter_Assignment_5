import 'package:stacked/stacked.dart';

class LoginViewmodel extends BaseViewModel {
  bool ischeck = false;

  bool get _ischeck => ischeck;

  checkbox(bool? value) {
    // remmeber me check box
    ischeck = value ?? false;
    notifyListeners();
  }
}
