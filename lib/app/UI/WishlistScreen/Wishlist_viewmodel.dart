import 'package:flutter_assignment_5/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WishlistViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToBack() {
    _navigationService.back();
  }
}
