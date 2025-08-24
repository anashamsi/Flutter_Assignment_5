import 'package:flutter_assignment_5/app/app.locator.dart';
import 'package:flutter_assignment_5/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductViewmodel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void naviagateToBack() {
    _navigationService.back();
  }

  void navigateToWishlistView() {
    _navigationService.navigateToWishlistView();
  }
}
